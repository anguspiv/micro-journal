# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.1.x   | :white_check_mark: |

## Reporting a Vulnerability

We take security seriously. If you discover a security vulnerability in Microlog, please follow these steps:

### 1. **DO NOT** create a public GitHub issue

Instead, report security vulnerabilities privately using one of these methods:

### 2. Private Disclosure Options

#### GitHub Security Advisories (Preferred)
1. Go to https://github.com/anguspiv/micro-journal/security/advisories
2. Click "New draft security advisory"
3. Fill out the form with details about the vulnerability

#### Email
Send an email to: angusp@angusp.com
- Include "SECURITY:" in the subject line
- Provide a detailed description of the vulnerability
- Include steps to reproduce if possible
- Mention any potential impact

### 3. What to Include

When reporting a vulnerability, please include:
- Description of the vulnerability
- Steps to reproduce the issue
- Potential impact and attack scenarios
- Any suggested fixes (optional)
- Your contact information for follow-up

### 4. Response Timeline

- **Initial Response**: Within 48 hours
- **Initial Assessment**: Within 1 week
- **Status Updates**: At least weekly until resolved
- **Resolution**: Target 30 days for most issues

### 5. Coordinated Disclosure

- We follow responsible disclosure practices
- We'll work with you to understand and fix the issue
- We'll coordinate the timing of public disclosure
- We'll credit you appropriately (unless you prefer to remain anonymous)

### 6. Security Best Practices

For users of Microlog:

#### Data Protection
- Journal entries are stored locally by default
- Be cautious when enabling cloud sync features
- Use appropriate file permissions for your journal database
- Consider encrypting sensitive journal content

#### Network Security
- Verify checksums when downloading binaries
- Use package managers when available for automatic verification
- Keep Microlog updated to the latest version

#### System Security
- Run Microlog with appropriate user permissions
- Avoid running as root/administrator unless necessary
- Monitor log files for unusual activity

### 7. Known Security Considerations

#### Local Data Storage
- Journal entries are stored in a local SQLite database
- File permissions should be set appropriately (600/640)
- Consider full-disk encryption for sensitive journals

#### Export Features
- Exported files inherit the security of the target location
- Be mindful of where you export journal data
- Exported files may not be automatically encrypted

#### Future Cloud Features
- Cloud sync will be optional and explicit
- End-to-end encryption will be implemented for cloud features
- Users will have full control over their data

### 8. Security Updates

Security updates will be:
- Released as soon as possible after fixes are ready
- Announced in release notes with appropriate severity levels
- Tagged clearly in the repository and releases
- Communicated through GitHub security advisories

### 9. Acknowledgments

We appreciate security researchers and users who help keep Microlog secure. Contributors will be acknowledged in:
- Security advisories (with permission)
- Release notes for security fixes
- A dedicated section in our documentation

Thank you for helping keep Microlog and its users safe!