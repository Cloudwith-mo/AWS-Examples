# AWS-Examples

Local AWS CLI practice workspace for certification prep, currently focused on S3 automation with bash scripts.

## Status

- AWS CLI bootstrap script is working.
- S3 script set exists in `s3/bash-scripts`.
- `put-object` is still a placeholder.

## Prerequisites

- AWS CLI v2
- Configured AWS credentials (`aws configure`)
- `jq` (for bucket listing scripts)
- `tree` (for `sync` output preview)

## Bootstrap AWS CLI

Run:

```bash
bash ./bootstrap-aws.sh
```

The script:

1. Detects OS (Linux, macOS, Windows via Git Bash/MSYS/Cygwin).
2. Installs AWS CLI v2 if missing.
3. Verifies install with `aws --version`.
4. Sets `AWS_CLI_AUTO_PROMPT=on-partial` for the current shell session.
5. Cleans up installer artifacts.

## S3 Scripts

All scripts are in `s3/bash-scripts`:

- `create-bucket <bucket>`: create bucket (`us-east-1`)
- `delete-bucket <bucket>`: delete bucket (must be empty)
- `get-newest-bucket`: print newest bucket name
- `list-buckets`: print 5 newest buckets
- `list-objects <bucket>`: list objects in bucket
- `put-object`: placeholder
- `sync <bucket> <prefix>`: generate random local files and sync to `s3://<bucket>/files`

## Quick Start

1. Install and verify CLI:

	```bash
	bash ./bootstrap-aws.sh
	aws --version
	```

2. Configure AWS credentials:

	```bash
	aws configure
	aws sts get-caller-identity
	```

3. Try S3 scripts:

```bash
./s3/bash-scripts/create-bucket my-unique-bucket-name
./s3/bash-scripts/list-buckets
./s3/bash-scripts/sync my-unique-bucket-name demo
./s3/bash-scripts/list-objects my-unique-bucket-name
```

## Notes

- On Windows, run scripts from Git Bash or another bash-compatible shell.
- If `aws` is not recognized after install, open a new terminal and retry.
