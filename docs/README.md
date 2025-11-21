# Microlog Documentation

This directory contains the source files for the Microlog documentation website, built with [mdBook](https://rust-lang.github.io/mdBook/).

## 🌐 Live Documentation

The documentation is automatically built and deployed to GitHub Pages:
**https://anguspiv.github.io/micro-journal/**

## 📚 Documentation Structure

```
docs/
├── book.toml           # mdBook configuration
├── src/                # Documentation source files
│   ├── SUMMARY.md      # Table of contents
│   ├── introduction.md # Introduction page
│   ├── user-guide/     # User-focused documentation
│   ├── export-formats/ # Export format guides
│   ├── integrations/   # Integration guides
│   ├── dev/           # Developer documentation
│   ├── reference/     # Reference materials
│   └── generated/     # Auto-generated content (CLI help, API docs)
└── book/              # Generated output (git-ignored)
```

## 🔧 Building Locally

### Prerequisites

1. **Install mdBook**:
   ```bash
   cargo install mdbook
   ```

2. **Install plugins** (optional but recommended):
   ```bash
   cargo install mdbook-linkcheck  # Link validation
   cargo install mdbook-toc        # Table of contents generation
   cargo install mdbook-mermaid    # Mermaid diagram support
   ```

### Build and Serve

```bash
cd docs

# Build the documentation
mdbook build

# Serve locally with auto-reload
mdbook serve

# Open http://localhost:3000
```

### Generate CLI Documentation

The documentation includes auto-generated CLI help:

```bash
cd ../core

# Build the CLI
cargo build --release

# Generate help documentation
./target/release/microlog --help > ../docs/src/generated/help.txt
./target/release/microlog add --help > ../docs/src/generated/help-add.txt
# ... etc for other commands
```

## 📝 Writing Documentation

### Style Guide

- **Use clear, concise language** - Assume users are new to micro-journaling
- **Include examples** - Show actual CLI commands and their output
- **Structure with headings** - Use proper heading hierarchy (H1 → H2 → H3)
- **Cross-reference** - Link to related sections liberally
- **Test code examples** - Ensure all CLI examples actually work

### File Organization

- **User Guide**: Step-by-step tutorials and how-tos
- **Export Formats**: Specific guides for each export format
- **Integrations**: How to use Microlog with other tools
- **Reference**: Complete command and configuration reference
- **Developer Docs**: Architecture, contributing, API reference

### Adding New Pages

1. **Create the markdown file** in the appropriate directory
2. **Add to SUMMARY.md** to include it in navigation
3. **Link from relevant pages** to improve discoverability
4. **Test locally** with `mdbook serve`

## 🤖 Automated Updates

### GitHub Actions

The documentation is automatically updated when:

- **Code changes**: API documentation regenerates from Rust comments
- **CLI changes**: Help text is auto-extracted from the CLI
- **Documentation changes**: Site rebuilds and deploys

### What's Auto-Generated

- **CLI Help**: Command help text from clap
- **API Documentation**: From Rust documentation comments
- **Command Reference**: Generated from CLI structure

### What's Manual

- **User guides and tutorials**
- **Integration examples**
- **Getting started content**
- **Export format specifics**

## 🔗 Links and Cross-References

### Internal Links

```markdown
[Installation Guide](./user-guide/installation.md)
[Command Reference](../reference/commands.md)
```

### External Links

```markdown
[Obsidian](https://obsidian.md/)
[GitHub Repository](https://github.com/anguspiv/micro-journal)
```

### Link Checking

Links are automatically checked in CI:
```bash
mdbook test  # Validates all links
```

## 📋 Documentation Checklist

When adding new features:

- [ ] Update relevant user guide sections
- [ ] Add command examples if CLI changed
- [ ] Update configuration reference if needed
- [ ] Add integration examples if applicable
- [ ] Test all code examples locally
- [ ] Check links work correctly
- [ ] Update navigation (SUMMARY.md) if needed

## 🚀 Deployment

Documentation deploys automatically to GitHub Pages when:
- Changes are pushed to the `main` branch
- Changes are made to files in the `docs/` directory
- CLI interface changes (auto-regenerates help)

The deployment process:
1. **Build**: mdBook compiles markdown to HTML
2. **Generate**: CLI help and API docs are generated
3. **Deploy**: Static files are uploaded to GitHub Pages
4. **Live**: Available at https://anguspiv.github.io/micro-journal/

## 💡 Tips

- **Preview locally** before pushing with `mdbook serve`
- **Use relative paths** for internal links
- **Include code examples** that users can copy-paste
- **Add screenshots** for GUI integrations (store in `src/images/`)
- **Write from user perspective** - focus on outcomes, not implementation
- **Update CHANGELOG** when adding major documentation sections

## 🤝 Contributing

Documentation improvements are welcome! See the main [CONTRIBUTING.md](../CONTRIBUTING.md) for guidelines.

For documentation-specific contributions:
- Focus on clarity and user benefit
- Test all examples before submitting
- Follow the existing style and structure
- Consider the target audience (beginners vs. power users)