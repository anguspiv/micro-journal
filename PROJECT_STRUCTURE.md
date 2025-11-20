# Micro Journal - Project Structure

## Repository Strategy

### Primary Repository: `micro-journal` (Monorepo)
All core development happens here with shared CI/CD, documentation, and coordinated releases.

### Secondary Repositories:
- `micro-journal-ios` - iOS app for App Store (references core as submodule/package)
- `micro-journal-android` - Android app for Play Store (references core as submodule/package)

## Monorepo Structure

```
micro-journal/
├── README.md
├── CHANGELOG.md
├── LICENSE
├── Makefile                 # Cross-platform build commands
├── .github/
│   ├── workflows/           # CI/CD for all platforms
│   ├── ISSUE_TEMPLATE/
│   └── PULL_REQUEST_TEMPLATE.md
├── docs/                    # Project documentation
│   ├── ARCHITECTURE.md
│   ├── API.md
│   ├── CONTRIBUTING.md
│   └── DEPLOYMENT.md
├── core/                    # Rust CLI tool (foundation)
│   ├── src/
│   │   ├── main.rs
│   │   ├── cli/             # CLI command definitions
│   │   ├── db/              # Database operations
│   │   ├── export/          # Export engine
│   │   ├── models/          # Data models
│   │   └── config/          # Configuration management
│   ├── Cargo.toml
│   ├── Cargo.lock
│   ├── tests/
│   └── benches/             # Performance benchmarks
├── apps/
│   ├── desktop-macos/       # SwiftUI macOS application
│   │   ├── MicroJournal.xcodeproj
│   │   ├── MicroJournal/
│   │   │   ├── Views/
│   │   │   ├── Models/
│   │   │   ├── Services/    # CLI integration layer
│   │   │   └── Resources/
│   │   └── Tests/
│   ├── desktop-tauri/       # Cross-platform desktop (Windows/Linux)
│   │   ├── src-tauri/       # Rust backend
│   │   ├── src/             # Frontend (React/Vue/etc)
│   │   ├── package.json
│   │   └── tauri.conf.json
│   ├── web/                 # Web application
│   │   ├── server/          # API server (Rust)
│   │   │   ├── src/
│   │   │   └── Cargo.toml
│   │   ├── client/          # Frontend
│   │   │   ├── src/
│   │   │   ├── package.json
│   │   │   └── vite.config.js
│   │   └── docker-compose.yml
│   └── docs/                # Documentation website
│       ├── src/
│       ├── package.json
│       └── docusaurus.config.js
├── packages/                # Shared packages and utilities
│   ├── data-formats/        # Export format specifications
│   │   ├── obsidian/
│   │   ├── markdown/
│   │   ├── apple-notes/
│   │   └── schemas/         # JSON schemas for data formats
│   ├── templates/           # Export templates
│   │   ├── daily-summary.hbs
│   │   ├── obsidian-note.hbs
│   │   └── custom/
│   └── test-data/           # Shared test fixtures
├── scripts/                 # Build and development scripts
│   ├── build.sh             # Cross-platform builds
│   ├── release.sh           # Release automation
│   ├── dev-setup.sh         # Development environment setup
│   └── test-all.sh          # Run tests across all components
├── dist/                    # Build outputs
│   ├── cli/                 # CLI binaries for each platform
│   ├── desktop/             # Desktop app packages
│   └── web/                 # Web deployment artifacts
└── .gitignore
```

## Development Workflow

### Phase 1: CLI Foundation
```bash
# Work primarily in core/
cd core/
cargo build
cargo test
cargo run -- add "test entry"
```

### Phase 2: Desktop Apps
```bash
# macOS development
cd apps/desktop-macos/
open MicroJournal.xcodeproj

# Cross-platform desktop
cd apps/desktop-tauri/
npm install
npm run tauri dev
```

### Phase 3: Web Application
```bash
# Full-stack development
cd apps/web/
docker-compose up  # Start development environment
```

## Build System

### Makefile Commands
```makefile
# Build all platforms
make build-all

# Development commands
make dev-cli        # Run CLI in development mode
make dev-macos      # Run macOS app in development
make dev-web        # Run web app in development

# Testing
make test-all       # Run all tests
make test-cli       # Test CLI only
make test-integration  # Cross-component integration tests

# Release
make release        # Build release versions of everything
make package        # Create distribution packages
```

### CI/CD Strategy

#### Main Repository Workflows
1. **CLI Testing** - Test Rust CLI on Linux, macOS, Windows
2. **Integration Testing** - Test CLI with each UI layer
3. **Release Building** - Build binaries for all platforms
4. **Documentation** - Deploy docs site

#### Mobile Repository Workflows
1. **iOS Workflow** - Xcode build, TestFlight deployment
2. **Android Workflow** - Gradle build, Play Console deployment

## Benefits of This Structure

### For Solo Development
- **Single clone** for most development
- **Coordinated releases** across all platforms
- **Shared tooling** and documentation
- **Simplified dependency management**

### For Team Scaling
- **Clear boundaries** between components
- **Independent deployment** of web vs desktop vs mobile
- **Platform expertise** - mobile teams can focus on their repos
- **Shared core logic** - CLI changes benefit all platforms

### For Users
- **Consistent experience** across platforms
- **Feature parity** - new CLI features available everywhere
- **Single source of truth** for documentation and issues

## Migration Strategy

### Start Simple
1. Begin with just `core/` directory
2. Add `apps/desktop-macos/` when ready for GUI
3. Expand to other platforms progressively

### Mobile Apps Later
- Create separate iOS/Android repos when ready for app stores
- Reference main repo as git submodule or package dependency
- Keep store-specific metadata separate

This structure grows with your project while maintaining clean separation of concerns.