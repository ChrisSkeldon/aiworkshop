---
description: Create aiworkshop GitHub repository from ProjectGengar Step-16 branch
auto_execution_mode: 3
---

# Create aiworkshop GitHub Repository

Create the public `aiworkshop` repository and populate it from the ProjectGengar `Step-16` branch using the GitHub MCP server.

## Workflow

1. Use GitHub MCP to get the authenticated username.
2. Create `aiworkshop` as a public repository with description `AI Workshop - OpenEdge ABL Project` and without auto-initialization.
3. Ensure the local `Step-16` branch is checked out, fetching it from `origin` when necessary.
4. Use `git ls-files` to collect tracked text files. Include core configuration, business classes/includes, all `.w` windows, Windsurf rules/workflows, GitHub issue templates, business documentation, and the Sports2000 schema. Exclude `.git`, generated code, database binaries, environment configuration, scripts, and large library documentation.
5. Initialize `main` with a README, then push related files in batches with the GitHub MCP multi-file push tool. Use individual file creation for large documentation where appropriate.
6. Verify the resulting repository tree and report its URL.
