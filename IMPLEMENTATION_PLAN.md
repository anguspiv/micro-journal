# Micro Journal - Implementation Plan (macOS-First)

## Phase 1: CLI Foundation (MVP)
**Timeline: 3-4 weeks**

### Week 1-2: Core CLI Tool
- [ ] Rust cargo project setup with clap
- [ ] SQLite database schema with rusqlite
- [ ] Entry data models with serde
- [ ] Basic entry CRUD operations
- [ ] Core `add`, `list`, `export` commands

### Week 3-4: Advanced CLI Features
- [ ] Export engine with multiple formats (Markdown, Obsidian)
- [ ] Daily consolidation logic and `consolidate` command
- [ ] Configuration system with `config` command
- [ ] Interactive `prompt` command
- [ ] Comprehensive testing and validation

## Phase 2: macOS GUI Application
**Timeline: 3-4 weeks**

### Week 1-2: SwiftUI Wrapper
- [ ] macOS app project setup
- [ ] SwiftUI interface calling Go CLI binary
- [ ] Entry creation and list views
- [ ] Settings and configuration UI
- [ ] Process management for CLI binary calls

### Week 3-4: macOS Integration
- [ ] Native notifications for prompting
- [ ] Menu bar integration
- [ ] Background scheduling daemon
- [ ] Keyboard shortcuts and accessibility
- [ ] Polish and testing

## Phase 3: Enhanced Features & Background Services
**Timeline: 3-4 weeks**

### Week 1-2: Scheduling & Automation
- [ ] Background daemon for scheduled prompts
- [ ] `schedule` and `daemon` CLI commands
- [ ] macOS LaunchAgent integration
- [ ] Advanced export templates and automation

### Week 3-4: Power User Features
- [ ] Shortcuts app integration
- [ ] Alfred/Raycast workflow support
- [ ] Advanced CLI features (search, tags, etc.)
- [ ] Share extension for quick capture

## Phase 4: Cross-Platform Foundation
**Timeline: 5-6 weeks**

### Week 1-3: iOS Application
- [ ] iOS app project sharing core Swift package
- [ ] SwiftUI iOS interface
- [ ] CloudKit integration for sync between macOS/iOS
- [ ] iOS-specific features (widgets, shortcuts)
- [ ] App Store preparation

### Week 4-6: Web Application
- [ ] Web API server exposing CLI functionality
- [ ] React/TypeScript web interface
- [ ] Progressive Web App setup
- [ ] Cross-platform data sync design

## Phase 5: Platform Expansion
**Timeline: 6-8 weeks**

### Week 1-3: Android Application
- [ ] React Native or native Android
- [ ] Google Drive sync integration
- [ ] Android-specific features
- [ ] Play Store preparation

### Week 4-6: Windows/Linux
- [ ] Electron or Tauri desktop apps
- [ ] Cross-platform sync compatibility
- [ ] Platform-specific integrations

### Week 7-8: Ecosystem Integration
- [ ] Cross-platform data sync
- [ ] Unified settings and preferences
- [ ] Beta testing across platforms

## Success Metrics

### Phase 1 Goals (CLI Foundation)
- [ ] Complete CLI tool with all core commands
- [ ] SQLite data storage working
- [ ] Export to Markdown and Obsidian formats
- [ ] Interactive prompting system
- [ ] Comprehensive test coverage

### Phase 2 Goals (macOS GUI)
- [ ] SwiftUI app calling CLI tool
- [ ] Native macOS notifications
- [ ] Menu bar integration
- [ ] Seamless GUI/CLI interaction

### Phase 3 Goals (Enhanced Features)
- [ ] Background scheduling daemon
- [ ] Power user automation features
- [ ] Shortcuts app integration
- [ ] Advanced export templates

### Phase 4 Goals (Cross-Platform)
- [ ] iOS app with shared core
- [ ] Web interface with API server
- [ ] CloudKit sync between Apple devices
- [ ] Cross-platform data compatibility

## Development Priorities

1. **User Experience**: Minimal friction for entry creation
2. **Reliability**: Data integrity and backup systems
3. **Flexibility**: Support for various export formats
4. **Performance**: Fast loading and responsive interface
5. **Privacy**: Local-first with optional cloud features