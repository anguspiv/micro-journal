# Introduction

Welcome to **Microlog** - a micro-journaling CLI tool designed for quick daily entries that consolidate into comprehensive journal files.

## What is Micro-Journaling?

Micro-journaling is the practice of making brief, frequent journal entries throughout the day rather than writing long entries once daily. It helps you:

- 📝 **Capture moments** as they happen
- 🧠 **Reduce memory burden** - no need to remember everything at day's end
- 🔄 **Build consistent habits** through small, manageable actions
- 📊 **Track patterns** in mood, activities, and thoughts
- ⚡ **Lower barrier to entry** - quick entries require less commitment

## Why Microlog?

Traditional journaling apps often require you to:
- Remember to write at specific times
- Recall everything that happened during the day
- Write lengthy entries when motivation is low
- Use heavy GUI applications

**Microlog solves these problems by:**

- 🚀 **Lightning-fast CLI interface** - add entries in seconds
- 🔔 **Configurable prompts** - gentle reminders throughout the day
- 🔄 **Automatic consolidation** - combines micro-entries into daily journals
- 🎯 **Universal export** - works with any journaling app or workflow
- 🌍 **Cross-platform** - same tool on macOS, Linux, and Windows
- 🛠️ **Power-user friendly** - scriptable and automation-ready

## Core Concept

```
Micro Entries → Daily Consolidation → Export to Your Preferred Format
     ↓                    ↓                         ↓
"Quick lunch"    →    Daily Summary    →    Obsidian, Apple Notes,
"Great meeting"       with timestamps       Markdown, etc.
"Tired feeling"
```

## Quick Example

```bash
# Throughout the day
microlog add "Great coffee meeting with Sarah"
microlog add "Feeling energized after the gym"
microlog add "Productive coding session on the CLI"

# End of day
microlog consolidate --format obsidian --output ~/Notes/Journal/

# Result: A complete daily entry in your preferred format
```

## Who Is This For?

**Perfect if you:**
- ✅ Love command-line tools
- ✅ Want to journal more consistently
- ✅ Prefer lightweight, fast tools
- ✅ Use multiple devices/platforms
- ✅ Want to integrate journaling with existing workflows
- ✅ Value data ownership and privacy

**Maybe not ideal if you:**
- ❌ Prefer GUI applications exclusively
- ❌ Want social/sharing features
- ❌ Need complex multimedia editing
- ❌ Require real-time collaboration

## Getting Started

Ready to start micro-journaling? Head to the [Installation Guide](./user-guide/installation.md) or jump straight to [Quick Start](./user-guide/quick-start.md) to begin capturing your day in small, meaningful moments.

---

*Microlog is open-source and built with privacy in mind. Your journal entries are stored locally by default, giving you complete control over your data.*