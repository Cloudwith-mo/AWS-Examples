# AWS-Examples

A minimal local workspace for AWS certification course examples.

## What Is In This Repo

- `README.md`: setup and usage instructions
- `bootstrap-aws.sh`: cross-platform local AWS CLI bootstrap script

This repo is intentionally local-first and minimal.

## What The Bootstrap Script Does

`bootstrap-aws.sh` will:

1. Detect your OS (Linux, macOS, or Windows via Git Bash/MSYS/Cygwin).
2. Install AWS CLI v2 only if it is not already installed.
3. Verify the installation with `aws --version`.
4. Set `AWS_CLI_AUTO_PROMPT=on-partial` for the current shell session.
5. Clean up downloaded installer files.

## How To Run It

### Linux / macOS

```bash
bash ./bootstrap-aws.sh
```

### Windows

Run from Git Bash (or a compatible bash shell):

```bash
bash ./bootstrap-aws.sh
```

The script automatically calls PowerShell for the MSI install on Windows.

## First-Time AWS CLI Configuration

After install, configure your credentials once:

```bash
aws configure
```

Then validate identity:

```bash
aws sts get-caller-identity
```

## Notes For Beginners

- In PowerShell, do not use `export` or `env` (those are bash commands).
- In PowerShell, use `$env:NAME="value"` format when needed.
- If `aws` is not recognized after install, open a new terminal and try again.
