# Quick Start

Get up and running with Microlog in under 5 minutes!

## Step 1: Verify Installation

First, make sure Microlog is installed and working:

```bash
microlog --version
```

You should see output like: `microlog 0.1.0`

## Step 2: Your First Entry

Create your first journal entry:

```bash
microlog add "Starting my micro-journaling journey with Microlog!"
```

That's it! Your first entry is now saved with a timestamp.

## Step 3: Add a Few More Entries

Throughout your day, capture moments as they happen:

```bash
microlog add "Great coffee this morning"
microlog add "Productive meeting with the design team"
microlog add "Feeling energized after lunch walk"
```

## Step 4: View Your Entries

See what you've captured today:

```bash
# Show today's entries
microlog list --date today

# Show recent entries
microlog list --recent 5

# Show entries from the last 3 days
microlog list --days 3
```

## Step 5: Export Your Journal

At the end of the day, consolidate your entries:

```bash
# Create a daily summary in Markdown
microlog consolidate --date today --format markdown --output ~/Journal/

# Or export to Obsidian format
microlog consolidate --date today --format obsidian --output ~/Notes/Journal/

# Or just export without consolidating
microlog export --format markdown --date today
```

## Pro Tips for Getting Started

### 1. Set Up Reminders

Use your system's scheduler to remind you to journal:

```bash
# Add to your crontab (Linux/macOS)
# Prompt every 3 hours during work day
0 9,12,15,18 * * * /usr/local/bin/microlog prompt

# Or create a simple reminder script
echo "microlog add" | pbcopy  # macOS - copies command to clipboard
```

### 2. Use Tags for Organization

Organize entries with tags:

```bash
microlog add "Completed the new feature" --tags work,programming,success
microlog add "Dinner with family" --tags personal,family
microlog add "Morning run felt great" --tags fitness,personal
```

### 3. Add Media to Entries

Attach photos or documents to entries:

```bash
microlog add "Beautiful sunset today" --media sunset.jpg
microlog add "Meeting notes" --media notes.pdf --tags work,meeting
```

### 4. Interactive Prompting

Use the interactive prompt for guided entry creation:

```bash
microlog prompt
# This will guide you through creating an entry
```

## Common Workflows

### Daily Routine

```bash
# Morning
microlog add "Woke up feeling refreshed" --tags mood,morning

# Throughout the day
microlog add "Great presentation feedback" --tags work,success
microlog add "Tried a new restaurant" --tags food,experience

# Evening
microlog consolidate --date today --format obsidian
```

### Weekly Review

```bash
# See everything from this week
microlog list --days 7

# Export the whole week
microlog export --format markdown --from "2024-01-15" --to "2024-01-21"
```

### Project Tracking

```bash
microlog add "Started new CLI project" --tags project,development
microlog add "Implemented basic commands" --tags project,development,progress
microlog add "Added tests and documentation" --tags project,development,testing
```

## Next Steps

Now that you've got the basics:

1. **Configure Microlog** - Check out [Configuration](./configuration.md) to customize behavior
2. **Explore Export Formats** - Learn about [Export Formats](../export-formats/overview.md)
3. **Set Up Automation** - See [Scheduling & Automation](./scheduling.md) for automated prompts
4. **Advanced Features** - Discover [Advanced Features](./advanced-features.md) for power users

## Need Help?

- **In-terminal help**: `microlog help` or `microlog <command> --help`
- **Troubleshooting**: See [Troubleshooting](./troubleshooting.md)
- **Full documentation**: Browse this guide or visit the [reference](../reference/commands.md)

Happy micro-journaling! 📝✨