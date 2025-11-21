# Installation

Microlog is available through multiple installation methods. Choose the one that works best for your platform and preferences.

## Quick Install

### macOS

```bash
# Homebrew (recommended)
brew install anguspiv/tap/microlog

# Or download directly
curl -L https://github.com/anguspiv/micro-journal/releases/latest/download/microlog-macos.tar.gz | tar xz
sudo mv microlog /usr/local/bin/
```

### Linux

```bash
# Download and install
curl -L https://github.com/anguspiv/micro-journal/releases/latest/download/microlog-linux.tar.gz | tar xz
sudo mv microlog /usr/local/bin/

# Or via package managers (coming soon)
# apt install microlog
# dnf install microlog
```

### Windows

```powershell
# Download from releases
# https://github.com/anguspiv/micro-journal/releases/latest/download/microlog-windows.zip

# Or via package managers (coming soon)
# winget install microlog
# choco install microlog
```

## Install from Source

### Prerequisites

- **Rust 1.70+** with Cargo
- **Git**

### Build and Install

```bash
# Clone the repository
git clone https://github.com/anguspiv/micro-journal.git
cd micro-journal

# Build and install
cd core
cargo install --path .

# Verify installation
microlog --version
```

### Development Build

```bash
# For development (creates debug build)
cargo build

# Run without installing
cargo run -- add "Test entry"
```

## Alternative Methods

### Cargo Install (from crates.io)

*Coming soon when published to crates.io*

```bash
cargo install microlog
```

### Docker

*Coming soon*

```bash
docker run --rm -v $(pwd):/data anguspiv/microlog add "Entry from Docker"
```

## Verification

After installation, verify everything works:

```bash
# Check version
microlog --version

# Get help
microlog --help

# Create a test entry
microlog add "Hello from Microlog!"

# List entries
microlog list
```

## Shell Completion

Enable shell completion for a better experience:

### Bash

```bash
# Add to ~/.bashrc
eval "$(microlog completion bash)"

# Or generate completion file
microlog completion bash > /usr/local/share/bash-completion/completions/microlog
```

### Zsh

```bash
# Add to ~/.zshrc
eval "$(microlog completion zsh)"

# Or generate completion file
microlog completion zsh > /usr/local/share/zsh/site-functions/_microlog
```

### Fish

```bash
# Generate completion file
microlog completion fish > ~/.config/fish/completions/microlog.fish
```

### PowerShell

```powershell
# Add to PowerShell profile
microlog completion powershell | Out-String | Invoke-Expression
```

## Configuration

Microlog stores its data in standard locations:

- **macOS**: `~/Library/Application Support/microlog/`
- **Linux**: `~/.config/microlog/`
- **Windows**: `%APPDATA%\microlog\`

The database file is `entries.db` and configuration is in `config.toml`.

## Troubleshooting

### Command not found

If you get "command not found" after installation:

1. **Check PATH**: Ensure the installation directory is in your PATH
2. **Restart terminal**: Some installers require a new shell session
3. **Verify location**: Check where the binary was installed

```bash
# Find where microlog is installed
which microlog

# Check your PATH
echo $PATH
```

### Permission issues

On Unix systems, you might need to make the binary executable:

```bash
chmod +x /path/to/microlog
```

### Database permissions

If you get database errors, check file permissions:

```bash
# Check microlog directory permissions
ls -la ~/.config/microlog/

# Fix permissions if needed
chmod 700 ~/.config/microlog/
chmod 600 ~/.config/microlog/entries.db
```

## Updating

### Homebrew

```bash
brew update && brew upgrade microlog
```

### Manual Updates

1. Download the latest release
2. Replace the existing binary
3. Run `microlog --version` to verify

### From Source

```bash
cd micro-journal
git pull origin main
cd core
cargo install --path .
```

---

**Next**: Once installed, head to the [Quick Start](./quick-start.md) guide to begin using Microlog!