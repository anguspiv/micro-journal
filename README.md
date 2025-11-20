# Micro Journal

A micro journaling application that prompts you at regular intervals to create quick journal entries, then consolidates them into daily journal files compatible with various journaling platforms.

## 🎯 Project Status

**Current Phase**: Phase 1 - Native macOS Application (MVP)
**Version**: Pre-release / Development
**Platform**: macOS (iOS, Web, and other platforms planned for future phases)

## ✨ Features

### Core Functionality
- **Regular Prompts**: Configurable intervals for journal entry reminders
- **Rich Content Support**: Text, photos, videos, and file attachments
- **Daily Consolidation**: Automatic compilation of micro entries into daily journal files
- **Multi-format Export**: Support for Obsidian, Apple Notes, Markdown, and plain text

### macOS Integration
- Native SwiftUI interface
- Menu bar integration for quick access
- Native notifications
- File system integration for exports
- Keyboard shortcuts and accessibility support

## 🚀 Getting Started

### Prerequisites
- macOS 14.0 or later
- Xcode 15.0 or later
- Swift 5.9 or later

### Installation

#### For Development
```bash
git clone https://github.com/yourusername/micro-journal.git
cd micro-journal
open MicroJournal.xcodeproj
```

#### For Users
*Coming soon - App Store and direct download releases*

## 📖 Documentation

- [Project Concept](PROJECT_CONCEPT.md) - Overview of the app concept and goals
- [Architecture](ARCHITECTURE.md) - Technical architecture and design decisions
- [Implementation Plan](IMPLEMENTATION_PLAN.md) - Development roadmap and phases
- [GitHub Project Setup](GITHUB_PROJECT_SETUP.md) - Project management and contribution guidelines

## 🛠️ Development

### Project Structure
```
micro-journal/
├── Sources/               # Swift source code
├── Tests/                # Unit and integration tests
├── Resources/            # Assets, localizations
├── Documentation/        # Detailed documentation
└── .github/             # GitHub templates and workflows
```

### Building and Testing
```bash
# Build the project
swift build

# Run tests
swift test

# Run with coverage
swift test --enable-code-coverage
```

### Code Quality
We use SwiftLint for code style enforcement:
```bash
# Install SwiftLint
brew install swiftlint

# Run linting
swiftlint
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

### Phase 1: macOS MVP *(Current)*
- [x] Project setup and architecture
- [ ] Core entry creation and management
- [ ] Basic export functionality
- [ ] Native macOS integration

### Phase 2: Enhanced Features
- [ ] Advanced export formats
- [ ] macOS ecosystem integration (Shortcuts, Spotlight)
- [ ] Enhanced UI and user experience

### Phase 3: Cross-Platform
- [ ] iOS application
- [ ] Web application
- [ ] Data synchronization

### Phase 4: Platform Expansion
- [ ] Android application
- [ ] Windows and Linux desktop apps

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