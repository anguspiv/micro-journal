#!/bin/bash

# Script to check if commits follow conventional commit format
# Usage: ./scripts/check-commits.sh [base-branch]

set -e

BASE_BRANCH=${1:-main}
CURRENT_BRANCH=$(git branch --show-current)

echo "🔍 Checking conventional commits on branch: $CURRENT_BRANCH"
echo "📍 Base branch: $BASE_BRANCH"
echo

# Check if we're on main branch
if [ "$CURRENT_BRANCH" = "$BASE_BRANCH" ]; then
    echo "⚠️  You're on the $BASE_BRANCH branch. Checking last commit only."
    COMMIT_RANGE="HEAD~1..HEAD"
else
    # Get the merge base to find commits unique to this branch
    BASE_COMMIT=$(git merge-base HEAD origin/$BASE_BRANCH 2>/dev/null || git merge-base HEAD $BASE_BRANCH)
    COMMIT_RANGE="${BASE_COMMIT}..HEAD"
fi

echo "📊 Analyzing commits in range: $COMMIT_RANGE"
echo

# Conventional commit pattern
CONVENTIONAL_PATTERN='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\(.+\))?!?: .+'

# Check each commit
FAILED_COMMITS=()
PASSED_COMMITS=()

while IFS= read -r commit_line; do
    if [ -z "$commit_line" ]; then
        continue
    fi

    commit_hash=$(echo "$commit_line" | cut -d' ' -f1)
    commit_message=$(echo "$commit_line" | cut -d' ' -f2-)
    short_hash=${commit_hash:0:7}

    if echo "$commit_message" | grep -E "$CONVENTIONAL_PATTERN" > /dev/null; then
        PASSED_COMMITS+=("✅ $short_hash: $commit_message")
    else
        FAILED_COMMITS+=("❌ $short_hash: $commit_message")
    fi
done < <(git log --format="%H %s" $COMMIT_RANGE --no-merges --reverse)

# Report results
echo "📋 Results:"
echo

if [ ${#PASSED_COMMITS[@]} -gt 0 ]; then
    echo "✅ Conventional commits (${#PASSED_COMMITS[@]}):"
    printf '%s\n' "${PASSED_COMMITS[@]}"
    echo
fi

if [ ${#FAILED_COMMITS[@]} -gt 0 ]; then
    echo "❌ Non-conventional commits (${#FAILED_COMMITS[@]}):"
    printf '%s\n' "${FAILED_COMMITS[@]}"
    echo

    echo "💡 Suggestions:"
    echo "   • Use: feat(scope): description  - for new features"
    echo "   • Use: fix(scope): description   - for bug fixes"
    echo "   • Use: docs: description         - for documentation"
    echo "   • Use: refactor: description     - for code refactoring"
    echo "   • Use: test: description         - for tests"
    echo "   • Use: chore: description        - for maintenance"
    echo
    echo "📚 Learn more: https://www.conventionalcommits.org/"
    echo

    # Suggest fixes for common patterns
    echo "🔧 Quick fixes for your commits:"
    for commit in "${FAILED_COMMITS[@]}"; do
        message=$(echo "$commit" | sed 's/❌ [a-f0-9]*: //')

        if [[ $message =~ [Aa]dd|[Ii]mplement|[Cc]reate ]]; then
            echo "   git rebase -i HEAD~n  # Then edit: feat: $(echo $message | tr '[:upper:]' '[:lower:]')"
        elif [[ $message =~ [Ff]ix|[Bb]ug ]]; then
            echo "   git rebase -i HEAD~n  # Then edit: fix: $(echo $message | tr '[:upper:]' '[:lower:]')"
        elif [[ $message =~ [Dd]oc|[Rr]eadme ]]; then
            echo "   git rebase -i HEAD~n  # Then edit: docs: $(echo $message | tr '[:upper:]' '[:lower:]')"
        else
            echo "   git rebase -i HEAD~n  # Then edit with appropriate type: $message"
        fi
    done
    echo

    exit 1
else
    echo "🎉 All commits follow conventional commit format!"
    echo

    # Show what kind of release this would trigger
    echo "📦 Release impact:"

    if git log $COMMIT_RANGE --grep="BREAKING CHANGE" --grep="!" | grep -q .; then
        echo "   🚀 Major version bump (breaking changes detected)"
    elif git log $COMMIT_RANGE --oneline | grep -E "^[a-f0-9]+ feat(\(.+\))?:" > /dev/null; then
        echo "   ⬆️  Minor version bump (new features)"
    elif git log $COMMIT_RANGE --oneline | grep -E "^[a-f0-9]+ (fix|perf)(\(.+\))?:" > /dev/null; then
        echo "   🔧 Patch version bump (bug fixes)"
    else
        echo "   📝 No version bump (documentation/chore changes)"
    fi

    echo
    exit 0
fi