#!/bin/bash

# Install git hooks for local development
# This script sets up commit-msg hook to validate conventional commits

set -e

HOOKS_DIR=".git/hooks"
COMMIT_MSG_HOOK="$HOOKS_DIR/commit-msg"
PRE_COMMIT_HOOK="$HOOKS_DIR/pre-commit"

echo "🔗 Installing git hooks for code quality and commit validation..."

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

# Create pre-commit hook for code quality
cat > "$PRE_COMMIT_HOOK" << 'EOF'
#!/bin/bash

# Pre-commit hook - run the comprehensive pre-commit script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# Check if pre-commit script exists
if [ -f "$PROJECT_ROOT/scripts/pre-commit-hook.sh" ]; then
    exec "$PROJECT_ROOT/scripts/pre-commit-hook.sh"
else
    echo "⚠️  Pre-commit script not found at $PROJECT_ROOT/scripts/pre-commit-hook.sh"
    echo "Skipping pre-commit checks..."
    exit 0
fi
EOF

chmod +x "$PRE_COMMIT_HOOK"

echo "✅ Git hooks installed successfully!"
echo
echo "📋 Installed hooks:"
echo "   • pre-commit: Runs code quality checks (format, lint, compile, test)"
echo "   • commit-msg: Validates conventional commit format"
echo "   • prepare-commit-msg: Provides helpful commit template"
echo
echo "💡 Usage:"
echo "   • Pre-commit hook runs automatically and auto-fixes issues when possible"
echo "   • Invalid code will block commits until fixed"
echo "   • Conventional commit format is enforced"
echo "   • Run './scripts/check-commits.sh' to validate existing commits"
echo
echo "🔧 Pre-commit checks include:"
echo "   • cargo fmt (auto-fixes formatting)"
echo "   • cargo clippy (auto-fixes some lints)"
echo "   • cargo check (compilation)"
echo "   • cargo test (all tests must pass)"
echo
echo "🔧 To skip temporarily:"
echo "   git commit --no-verify -m 'your message'"
echo
echo "🗑️  To uninstall:"
echo "   rm .git/hooks/pre-commit .git/hooks/commit-msg .git/hooks/prepare-commit-msg"