#!/usr/bin/env bash

# This script helps you set up AWS CLI locally on your machine.
# It is meant for local development.
#
# Supported flows:
# - Linux: download and install AWS CLI v2 from the official zip package
# - macOS: download and install AWS CLI v2 from the official .pkg installer
# - Windows (when run from Git Bash/MSYS/Cygwin): call PowerShell to run MSI install
#
# What this script does:
# 1. Detects your operating system.
# 2. Installs AWS CLI v2 if it is missing.
# 3. Verifies the AWS CLI installation.
# 4. Enables AWS auto-prompt for the current shell session.
# 5. Cleans up downloaded installer files.

# Fail fast if any command fails.
# -e : exit immediately on errors
# -u : treat unset variables as errors
# -o pipefail : fail a pipeline if any command in it fails
set -euo pipefail

# Capture OS string from uname for branching logic below.
OS="$(uname -s)"

echo "[1/3] Detecting OS: ${OS}"

# Linux install path using the official AWS CLI zip package.
# This requires sudo privileges for the installer step.
install_linux() {
  echo "Installing AWS CLI v2 for Linux..."
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip -o awscliv2.zip
  sudo ./aws/install --update

  # Clean up temporary installer files to keep the workspace minimal.
  rm -rf awscliv2.zip aws
}

# macOS install path using AWS official pkg installer.
# This requires sudo privileges for the installer step.
install_macos() {
  echo "Installing AWS CLI v2 for macOS..."
  curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
  sudo installer -pkg AWSCLIV2.pkg -target /

  # Remove downloaded installer package after successful installation.
  rm -f AWSCLIV2.pkg
}

# Windows install path.
# This branch assumes you ran this script from Git Bash/MSYS/Cygwin,
# then invokes PowerShell to run a silent MSI installation.
install_windows() {
  echo "Installing AWS CLI v2 for Windows via PowerShell..."
  powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-WebRequest -Uri 'https://awscli.amazonaws.com/AWSCLIV2.msi' -OutFile 'AWSCLIV2.msi'; Start-Process msiexec.exe -Wait -ArgumentList '/i AWSCLIV2.msi /quiet /norestart'; Remove-Item -Force AWSCLIV2.msi -ErrorAction SilentlyContinue"
}

# If aws command already exists, do not reinstall.
if command -v aws >/dev/null 2>&1; then
  echo "AWS CLI already installed. Skipping install."
else
  # Pick installer flow based on detected OS.
  case "${OS}" in
    Linux*) install_linux ;;
    Darwin*) install_macos ;;
    MINGW*|MSYS*|CYGWIN*) install_windows ;;
    *)
      echo "Unsupported OS: ${OS}"
      exit 1
      ;;
  esac
fi

# Confirm the installed CLI is accessible in PATH.
echo "[2/3] Verifying AWS CLI"
aws --version

# Set AWS CLI auto-prompt in the current shell session.
# Note: This is not persistent across new terminals unless you add it to
# your shell profile file (for example ~/.bashrc).
echo "[3/3] Setting AWS_CLI_AUTO_PROMPT for current shell"
export AWS_CLI_AUTO_PROMPT=on-partial
echo "AWS_CLI_AUTO_PROMPT=${AWS_CLI_AUTO_PROMPT}"

# Final guidance for first-time setup.
echo "Done. If this is your first time, run: aws configure"
