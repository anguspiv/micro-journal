use clap::CommandFactory;
use clap_mangen::Man;
use std::fs;
use std::path::Path;

use crate::Cli;

#[allow(dead_code)]
pub fn generate_man_pages<P: AsRef<Path>>(out_dir: P) -> std::io::Result<()> {
    let out_dir = out_dir.as_ref();

    // Create output directory if it doesn't exist
    fs::create_dir_all(out_dir)?;

    let cmd = Cli::command();

    // Generate main man page
    let man = Man::new(cmd.clone());
    let mut buffer: Vec<u8> = vec![];
    man.render(&mut buffer)?;

    fs::write(out_dir.join("microlog.1"), buffer)?;

    // Generate man pages for subcommands
    for subcommand in cmd.get_subcommands() {
        if subcommand.get_name() == "help" {
            continue;
        }

        let man = Man::new(subcommand.clone());
        let mut buffer: Vec<u8> = vec![];
        man.render(&mut buffer)?;

        let filename = format!("microlog-{}.1", subcommand.get_name());
        fs::write(out_dir.join(filename), buffer)?;
    }

    println!("Generated man pages in {}", out_dir.display());
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;
    use tempfile::TempDir;

    #[test]
    fn test_man_page_generation() {
        let temp_dir = TempDir::new().unwrap();
        let result = generate_man_pages(temp_dir.path());

        assert!(result.is_ok());

        // Check that main man page was created
        assert!(temp_dir.path().join("microlog.1").exists());

        // Check that subcommand man pages were created
        assert!(temp_dir.path().join("microlog-add.1").exists());
        assert!(temp_dir.path().join("microlog-list.1").exists());
    }
}