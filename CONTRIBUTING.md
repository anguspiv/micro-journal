# Contributing to Microlog

Thank you for your interest in contributing to Microlog! This document provides guidelines and information for contributors.

## Development Setup

### Prerequisites
- Rust 1.70+ with Cargo
- Git

### Getting Started
```bash
git clone https://github.com/anguspiv/micro-journal.git
cd micro-journal
cd core
cargo build
cargo test
```

### Running the CLI
```bash
cd core
cargo run -- --help
cargo run -- add "Test entry"
cargo run -- list
```

## Contribution Workflow

### 1. Fork and Clone
1. Fork the repository on GitHub
2. Clone your fork locally
3. Add the original repository as upstream:
   ```bash
   git remote add upstream https://github.com/anguspiv/micro-journal.git
   ```

### 2. Create a Branch
Create a feature branch from `main`:
```bash
git checkout -b feat/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### 3. Make Changes
- Write clean, well-documented code
- Follow Rust conventions and use `cargo fmt`
- Add tests for new functionality
- Update documentation if needed

### 4. Commit Changes
We use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages:

```
<type>(<scope>): <description>

<body>

<footer>
```

#### Commit Types & Release Impact
- **feat**: New feature (→ minor version bump)
- **fix**: Bug fix (→ patch version bump)
- **perf**: Performance improvement (→ patch version bump)
- **docs**: Documentation changes (→ no version bump)
- **style**: Code style changes (→ no version bump)
- **refactor**: Code refactoring (→ no version bump)
- **test**: Adding or updating tests (→ no version bump)
- **build**: Build system changes (→ no version bump)
- **ci**: CI/CD changes (→ no version bump)
- **chore**: Maintenance tasks (→ no version bump)

#### Breaking Changes
Add `!` after type or `BREAKING CHANGE:` in footer for major version bumps:
```bash
git commit -m "feat!: change CLI interface completely"
git commit -m "feat(api): add new endpoint

BREAKING CHANGE: removes the old /v1/entries endpoint"
```

#### Examples
```bash
git commit -m "feat(cli): add interactive prompt command"
git commit -m "fix(export): handle empty date ranges correctly"
git commit -m "docs: update CLI usage examples in README"
```

#### Local Validation Tools

**Install git hooks** for automatic validation and code quality:
```bash
./scripts/install-git-hooks.sh
```

This installs:
- **Pre-commit hook**: Runs `cargo fmt`, `cargo clippy`, compilation, and tests
- **Commit-msg hook**: Validates conventional commit format
- **Prepare-commit-msg**: Provides helpful commit templates

**Manual validation** before pushing:
```bash
# Check all commits on your branch
./scripts/check-commits.sh

# Run the same checks as pre-commit hook
./scripts/pre-commit-hook.sh
```

**Pre-commit hook features**:
- 🔧 **Auto-fixes** formatting and some lints
- 🚫 **Blocks commits** if code doesn't compile or tests fail
- 📝 **Stages fixes** automatically when possible
- ⚡ **Fast feedback** - catches issues before CI

**The CI system will automatically**:
- ✅ Validate conventional commit format
- 📊 Analyze release impact (version bump prediction)
- 💬 Comment on PRs with release impact and suggestions
- 🚨 Warn about missing documentation for new features
- 🔍 Run the same code quality checks as your local hooks

### 5. Push and Create PR
```bash
git push origin your-branch-name
```

Create a Pull Request on GitHub using our PR template.

## Code Guidelines

### Rust Style
- Use `cargo fmt` to format code
- Use `cargo clippy` to catch common issues
- Follow standard Rust naming conventions
- Write comprehensive tests

### Documentation
- Document public APIs with rustdoc
- Update README for user-facing changes
- Include examples in documentation

### Testing
- Write unit tests for all new functionality
- Include integration tests for CLI commands
- Test error conditions and edge cases

```bash
# Run tests
cargo test

# Run with coverage
cargo test --all-features

# Run clippy
cargo clippy -- -D warnings
```

## Project Structure

```
core/
├── src/
│   ├── main.rs          # CLI entry point
│   ├── cli/             # Command definitions
│   ├── db/              # Database operations
│   ├── export/          # Export functionality
│   ├── models/          # Data models
│   └── config/          # Configuration management
├── tests/               # Integration tests
└── benches/             # Performance benchmarks
```

## Issue Guidelines

### Bug Reports
- Use the bug report template
- Include steps to reproduce
- Provide system information
- Include relevant logs/error messages

### Feature Requests
- Use the feature request template
- Describe the use case clearly
- Consider implementation complexity
- Link to related issues if applicable

### User Stories
- Follow the format: "As a [user], I want [goal] so that [benefit]"
- Include clear acceptance criteria
- Consider different user types (casual, power user, etc.)

## Release Process

### Versioning
We follow [Semantic Versioning](https://semver.org/):
- **MAJOR**: Breaking changes
- **MINOR**: New features (backward compatible)
- **PATCH**: Bug fixes (backward compatible)

### Release Checklist
- [ ] Update version in `Cargo.toml`
- [ ] Update `CHANGELOG.md`
- [ ] Test all platforms
- [ ] Create release tag
- [ ] Build and publish binaries

## Getting Help

- **Documentation**: Check the project wiki
- **Discussions**: Use GitHub Discussions for questions
- **Issues**: Create an issue for bugs or feature requests
- **Discord/Slack**: [Link if available]

## Code of Conduct

This project follows the [Contributor Covenant Code of Conduct](CODE_OF_CONDUCT.md). Please read and follow it in all interactions.

## Recognition

Contributors will be recognized in:
- CONTRIBUTORS.md file
- Release notes for significant contributions
- Annual contributor acknowledgments

Thank you for contributing to Microlog! 🚀