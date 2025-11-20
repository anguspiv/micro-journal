# Micro Journal - System Architecture

## Technology Stack Recommendations

### Phase 1: CLI-First Architecture
**Rust CLI Tool + SQLite** (Foundation)
- **Core Engine**: Rust CLI tool with Clap framework
- **Data Persistence**: SQLite with rusqlite or sqlx
- **Export Engine**: Template-based format exporters (handlebars/tera)
- **Cross-platform**: Single binary for Windows, macOS, Linux

### Platform Layers
- **CLI Tool**: Rust binary - core functionality
- **macOS App**: SwiftUI wrapper calling CLI binary
- **iOS App**: SwiftUI with API bridge to shared data format
- **Web App**: Rust HTTP server (axum/warp) exposing CLI functionality
- **Native UI**: Tauri for cross-platform desktop (Rust + web frontend)

### Core Technologies
- **Foundation**: Rust with clap CLI framework
- **Data Layer**: SQLite with rusqlite or sqlx
- **Export System**: Handlebars or Tera for template generation
- **Config Management**: confy or config crate
- **Async Runtime**: tokio for async operations
- **Cross-platform**: Single Rust binary deployment

## CLI Command Structure

### Core Commands
```bash
# Entry Management
micro-journal add "Quick thought about the day"
micro-journal add --media photo.jpg "Photo from lunch"
micro-journal prompt                    # Interactive entry creation
micro-journal list --date today         # List today's entries
micro-journal list --range "last week"  # List entries from date range

# Export & Consolidation
micro-journal export --format obsidian --date today
micro-journal export --format markdown --output ~/Journal/
micro-journal consolidate --date today  # Create daily consolidated entry
micro-journal consolidate --auto        # Auto-consolidate based on schedule

# Scheduling & Automation
micro-journal schedule --interval 2h    # Prompt every 2 hours
micro-journal schedule --times "9:00,13:00,18:00,22:00"  # Specific times
micro-journal daemon start             # Start background scheduler
micro-journal daemon status            # Check daemon status

# Configuration
micro-journal config --set export.format=obsidian
micro-journal config --set export.path=~/Documents/Journal
micro-journal config --list            # Show all settings
```

### API Architecture
```
┌─────────────────────────────────────────────────────┐
│                    Platform UIs                    │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │ macOS App   │  │ iOS App     │  │ Web App     │  │
│  │ (SwiftUI)   │  │ (SwiftUI)   │  │ (React)     │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
└─────────────────┬───────────────────────────────────┘
                  │
┌─────────────────┴───────────────────────────────────┐
│              CLI Tool / Core Engine                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐  │
│  │   Entry     │  │   Export    │  │  Schedule   │  │
│  │  Manager    │  │   Engine    │  │  Manager    │  │
│  └─────────────┘  └─────────────┘  └─────────────┘  │
└─────────────────┬───────────────────────────────────┘
                  │
┌─────────────────┴───────────────────────────────────┐
│                Data Layer                           │
│         SQLite Database + File Storage              │
└─────────────────────────────────────────────────────┘
```

## System Architecture

### Core Components

#### 1. Prompt Scheduler
- Configurable interval system
- Background notifications
- User preference management

#### 2. Entry Manager
- Rich text editor with media support
- File attachment handling
- Draft saving and auto-recovery

#### 3. Data Layer
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Entry Store   │    │   Media Store   │    │  Settings Store │
│   (SQLite)      │    │ (File System)   │    │   (JSON/SQLite) │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │  Sync Manager   │
                    │ (Cloud Storage) │
                    └─────────────────┘
```

#### 4. Export Engine
- Format-specific exporters (Obsidian, Apple Notes, etc.)
- Template system for customization
- Batch processing for daily consolidation

#### 5. Sync System (Future)
- Cloud storage integration (iCloud, Google Drive, Dropbox)
- Conflict resolution
- Offline-first architecture

### Data Model

```typescript
interface MicroEntry {
  id: string;
  timestamp: Date;
  content: string;
  attachments: Attachment[];
  tags?: string[];
  mood?: string;
  location?: GeoLocation;
}

interface DailyJournal {
  date: Date;
  entries: MicroEntry[];
  consolidated: boolean;
  exportedTo: ExportFormat[];
}

interface ExportFormat {
  type: 'obsidian' | 'apple-notes' | 'markdown' | 'text';
  path: string;
  template?: string;
}
```

## Technical Decisions

### Local-First Approach
- Primary storage on device
- Cloud sync as enhancement, not requirement
- Works offline by default

### Cross-Platform Strategy
- Shared web codebase
- Platform-specific wrappers (Electron, React Native)
- Progressive Web App for broad compatibility

### Export Flexibility
- Plugin-based export system
- User-configurable templates
- Support for custom formats

## Security & Privacy
- Local encryption for sensitive data
- User controls for cloud sync
- No analytics without explicit consent
- Open source codebase for transparency