use clap::{CommandFactory, Parser, Subcommand};
use anyhow::Result;

mod man;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
#[command(name = "microlog")]
#[command(about = "A micro journaling CLI tool for quick daily entries")]
#[command(long_about = "
Microlog helps you capture your day through quick, frequent journal entries
that automatically consolidate into comprehensive daily journals.

Perfect for building consistent journaling habits with minimal friction.
Export to any format: Obsidian, Apple Notes, Markdown, and more.

Examples:
  microlog add \"Great coffee meeting with Sarah\"
  microlog list --date today
  microlog export --format obsidian
  microlog consolidate --date today

Visit https://anguspiv.github.io/micro-journal/ for full documentation.")]
struct Cli {
    #[command(subcommand)]
    command: Option<Commands>,
}

#[derive(Subcommand)]
enum Commands {
    /// Add a new journal entry
    #[command(long_about = "
Create a new micro journal entry with optional media and tags.

This is the core command for capturing moments throughout your day.
Entries are timestamped and stored in your local database.

Examples:
  microlog add \"Had an amazing lunch at the new cafe\"
  microlog add \"Productive meeting\" --tags work,success
  microlog add \"Beautiful sunset\" --media sunset.jpg
  microlog add \"Great workout session\" -t fitness -t personal")]
    Add {
        /// The content of the journal entry
        content: String,

        /// Add media files to the entry (photos, videos, documents)
        #[arg(short, long, value_name = "FILE")]
        media: Option<Vec<String>>,

        /// Add tags to categorize the entry
        #[arg(short, long, value_name = "TAG")]
        tags: Option<Vec<String>>,
    },

    /// List journal entries
    List {
        /// Date to list entries for (YYYY-MM-DD, 'today', 'yesterday')
        #[arg(short, long)]
        date: Option<String>,

        /// Number of recent entries to show
        #[arg(short, long)]
        recent: Option<u32>,

        /// Show entries from the last N days
        #[arg(long)]
        days: Option<u32>,
    },

    /// Export journal entries
    Export {
        /// Export format (markdown, obsidian, text, json)
        #[arg(short, long, default_value = "markdown")]
        format: String,

        /// Output file path
        #[arg(short, long)]
        output: Option<String>,

        /// Date range to export (YYYY-MM-DD)
        #[arg(long)]
        from: Option<String>,

        /// End date for export (YYYY-MM-DD)
        #[arg(long)]
        to: Option<String>,
    },

    /// Consolidate entries into a daily journal
    Consolidate {
        /// Date to consolidate (YYYY-MM-DD, 'today', 'yesterday')
        #[arg(short, long, default_value = "today")]
        date: String,

        /// Export format for consolidated entry
        #[arg(short, long, default_value = "markdown")]
        format: String,

        /// Output file path for consolidated entry
        #[arg(short, long)]
        output: Option<String>,
    },

    /// Interactive prompt for creating entries
    Prompt {
        /// Use a specific prompt template
        #[arg(short, long)]
        template: Option<String>,
    },

    /// Configuration management
    Config {
        /// Configuration key to get or set
        key: Option<String>,

        /// Value to set (if not provided, will get the value)
        value: Option<String>,

        /// List all configuration options
        #[arg(short, long)]
        list: bool,
    },
}

fn main() -> Result<()> {
    let cli = Cli::parse();

    match &cli.command {
        Some(Commands::Add { content, media, tags }) => {
            println!("Adding entry: {}", content);
            if let Some(media_files) = media {
                println!("Media files: {:?}", media_files);
            }
            if let Some(entry_tags) = tags {
                println!("Tags: {:?}", entry_tags);
            }
            // TODO: Implement add functionality
        },

        Some(Commands::List { date, recent, days }) => {
            println!("Listing entries...");
            if let Some(d) = date {
                println!("Date filter: {}", d);
            }
            if let Some(r) = recent {
                println!("Recent entries: {}", r);
            }
            if let Some(d) = days {
                println!("Last {} days", d);
            }
            // TODO: Implement list functionality
        },

        Some(Commands::Export { format, output, from, to }) => {
            println!("Exporting entries in {} format", format);
            if let Some(o) = output {
                println!("Output: {}", o);
            }
            if let Some(f) = from {
                println!("From: {}", f);
            }
            if let Some(t) = to {
                println!("To: {}", t);
            }
            // TODO: Implement export functionality
        },

        Some(Commands::Consolidate { date, format, output }) => {
            println!("Consolidating entries for {} in {} format", date, format);
            if let Some(o) = output {
                println!("Output: {}", o);
            }
            // TODO: Implement consolidate functionality
        },

        Some(Commands::Prompt { template }) => {
            println!("Starting interactive prompt...");
            if let Some(t) = template {
                println!("Using template: {}", t);
            }
            // TODO: Implement prompt functionality
        },

        Some(Commands::Config { key, value, list }) => {
            if *list {
                println!("Listing all configuration options...");
                // TODO: List all config
            } else if let Some(k) = key {
                if let Some(v) = value {
                    println!("Setting {} = {}", k, v);
                    // TODO: Set config value
                } else {
                    println!("Getting value for {}", k);
                    // TODO: Get config value
                }
            }
        },

        None => {
            // No command provided, show help
            let mut cmd = Cli::command();
            cmd.print_help()?;
        }
    }

    Ok(())
}
