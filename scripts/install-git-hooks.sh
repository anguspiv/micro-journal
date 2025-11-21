#!/bin/bash

# Install git hooks for local development
# This script sets up commit-msg hook to validate conventional commits

set -e

HOOKS_DIR=".git/hooks"
COMMIT_MSG_HOOK="$HOOKS_DIR/commit-msg"

echo "🔗 Installing git hooks for conventional commit validation..."

# Create hooks directory if it doesn't exist
mkdir -p "$HOOKS_DIR"

# Create commit-msg hook
cat > "$COMMIT_MSG_HOOK" << 'EOF'
#!/bin/bash

# Git hook to validate conventional commit format
# This runs every time you make a commit

commit_regex='^(feat|fix|docs|style|refactor|perf|test|build|ci|chore|revert)(\(.+\))?!?: .{1,50}'

error_msg="❌ Invalid commit message format!

Your commit message should follow conventional commit format:
  type(scope): description

Examples:
  feat(cli): add new list command
  fix(export): handle empty entries correctly
  docs: update installation instructions
  refactor: simplify database connection logic

Valid types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert

For breaking changes, add '!' after type or add 'BREAKING CHANGE:' in footer.

Learn more: https://www.conventionalcommits.org/
"

if ! grep -E "$commit_regex" "$1" > /dev/null; then
    echo "$error_msg" >&2
    echo "Your commit message:" >&2
    echo "$(cat $1)" >&2
    exit 1
fi
EOF

# Make hook executable
chmod +x "$COMMIT_MSG_HOOK"

# Create prepare-commit-msg hook for helpful template
cat > "$HOOKS_DIR/prepare-commit-msg" << 'EOF'
#!/bin/bash

# Git hook to provide commit message template
# Only applies to regular commits (not merge, etc.)

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2

# Only run for regular commits
if [ -z "$COMMIT_SOURCE" ] || [ "$COMMIT_SOURCE" = "message" ]; then
    # Check if message is empty or just whitespace
    if [ ! -s "$COMMIT_MSG_FILE" ] || ! grep -v '^[[:space:]]*$' "$COMMIT_MSG_FILE" > /dev/null; then
        cat > "$COMMIT_MSG_FILE" << 'TEMPLATE'
# type(scope): description
#
# Types:
#   feat:     A new feature
#   fix:      A bug fix
#   docs:     Documentation only changes
#   style:    Changes that do not affect the meaning of the code
#   refactor: A code change that neither fixes a bug nor adds a feature
#   perf:     A code change that improves performance
#   test:     Adding missing tests or correcting existing tests
#   build:    Changes that affect the build system or external dependencies
#   ci:       Changes to our CI configuration files and scripts
#   chore:    Other changes that don't modify src or test files
#
# Examples:
#   feat(cli): add interactive prompt command
#   fix(export): handle empty date ranges correctly
#   docs: update README with new installation method
#
# Breaking changes:
#   feat!: remove deprecated API
#   feat(cli)!: change command syntax
#
# Or add footer:
#   BREAKING CHANGE: removes the deprecated xyz API
TEMPLATE
    fi
fi
EOF

chmod +x "$HOOKS_DIR/prepare-commit-msg"

echo "✅ Git hooks installed successfully!"
echo
echo "📋 Installed hooks:"
echo "   • commit-msg: Validates conventional commit format"
echo "   • prepare-commit-msg: Provides helpful commit template"
echo
echo "💡 Usage:"
echo "   • Regular commits will show a template with examples"
echo "   • Invalid conventional commit messages will be rejected"
echo "   • Run './scripts/check-commits.sh' to validate existing commits"
echo
echo "🔧 To disable temporarily:"
echo "   git commit --no-verify -m 'your message'"
echo
echo "🗑️  To uninstall:"
echo "   rm .git/hooks/commit-msg .git/hooks/prepare-commit-msg"