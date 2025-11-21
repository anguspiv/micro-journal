# Micro Journal

A micro journaling application that prompts you at regular intervals to create quick journal entries, then consolidates them into daily journal files compatible with various journaling platforms.

## 🎯 Project Status

**Current Phase**: Phase 1 - CLI Foundation (MVP)
**Version**: Pre-release / Development
**Platform**: Cross-platform CLI (macOS, Linux, Windows)

## ✨ Features

### Core Functionality
- **Regular Prompts**: Configurable intervals for journal entry reminders
- **Rich Content Support**: Text, photos, videos, and file attachments
- **Daily Consolidation**: Automatic compilation of micro entries into daily journal files
- **Multi-format Export**: Support for Obsidian, Apple Notes, Markdown, and plain text
- **Cross-platform CLI**: Single binary that works on macOS, Linux, and Windows

### CLI Commands
- **`microlog add`**: Quick entry creation
- **`microlog list`**: View journal entries
- **`microlog export`**: Export to various formats
- **`microlog consolidate`**: Daily consolidation
- **`microlog prompt`**: Interactive prompting
- **`microlog config`**: Configuration management

## 🚀 Getting Started

### Prerequisites
- Rust 1.70+ with Cargo
- Git

### Installation

#### For Development
```bash
git clone https://github.com/anguspiv/micro-journal.git
cd micro-journal/core
cargo build
cargo run -- --help
```

#### Quick Start
```bash
# Add your first entry
cargo run -- add "Just tried microlog for the first time!"

# List entries
cargo run -- list

# Get help for any command
cargo run -- add --help
cargo run -- export --help
```

#### For Users
*Coming soon - Pre-built binaries and package manager installations*

## 📖 Documentation

- [Project Concept](PROJECT_CONCEPT.md) - Overview of the app concept and goals
- [Architecture](ARCHITECTURE.md) - Technical architecture and design decisions
- [Implementation Plan](IMPLEMENTATION_PLAN.md) - Development roadmap and phases
- [GitHub Project Setup](GITHUB_PROJECT_SETUP.md) - Project management and contribution guidelines

## 🛠️ Development

### Project Structure
```
micro-journal/
├── core/                  # Rust CLI application
│   ├── src/              # Rust source code
│   ├── tests/            # Unit and integration tests
│   └── Cargo.toml        # Rust project configuration
├── apps/                 # Future platform applications
├── docs/                 # Project documentation
└── .github/             # GitHub templates and workflows
```

### Building and Testing
```bash
# Build the project
cd core
cargo build

# Run tests
cargo test

# Run with coverage (requires cargo-tarpaulin)
cargo tarpaulin

# Build optimized release
cargo build --release
```

### Code Quality
We use Rust's built-in tools for code quality:
```bash
# Format code
cargo fmt

# Lint code
cargo clippy

# Check for issues
cargo check
```

## 📋 Project Management

We use GitHub Projects for task management:
- **Issues**: Feature requests, bugs, and user stories
- **Projects**: Kanban board for development progress
- **Milestones**: Phase-based delivery tracking
- **Wiki**: Detailed documentation and guides

### Contributing
1. Check our [Project Board](link-to-project-board) for available tasks
2. Create an issue using our templates for new features or bugs
3. Follow our [Contributing Guidelines](CONTRIBUTING.md)
4. Submit pull requests using our PR template

## 🎨 Export Formats

### Supported Formats
- **Markdown**: Standard markdown with frontmatter
- **Obsidian**: Obsidian-flavored markdown with metadata
- **Apple Notes**: Integration via URL schemes
- **Plain Text**: Simple text format

### Custom Templates
Users can create custom export templates to match their preferred journaling workflow.

## 🔄 Roadmap

### Phase 1: CLI Foundation *(Current)*
- [x] Project setup and architecture
- [x] Basic CLI command structure
- [ ] Database models and SQLite integration
- [ ] Core entry creation and management (`add` command)
- [ ] Entry listing functionality (`list` command)
- [ ] Basic export functionality (`export` command)

### Phase 2: macOS GUI Application
- [ ] SwiftUI wrapper calling CLI binary
- [ ] Native macOS notifications
- [ ] Menu bar integration
- [ ] GUI settings and preferences

### Phase 3: Enhanced Features & Background Services
- [ ] Background scheduling daemon
- [ ] Advanced export formats and templates
- [ ] Interactive prompting system
- [ ] Shortcuts app integration

### Phase 4: Cross-Platform Expansion
- [ ] iOS application (shared CLI core)
- [ ] Web application with API server
- [ ] Tauri desktop apps (Windows/Linux)
- [ ] Data synchronization across platforms

## 📄 License

[License details to be added]

## 🤝 Support

- **Issues**: Use GitHub Issues for bug reports and feature requests
- **Discussions**: Use GitHub Discussions for questions and community chat
- **Wiki**: Check the Wiki for detailed documentation and guides

## 🙏 Acknowledgments

- [Acknowledgments to be added as project develops]

---

**Note**: This project is in early development. Features and documentation will be updated regularly as development progresses.