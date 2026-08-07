# GitHub Repository Setup & Push Guide

Follow these steps to initialize a Git repository and push this codebase to your personal GitHub repository.

---

## Step 1: Open Terminal in Project Directory

Open PowerShell or Command Prompt and navigate to the project directory:

```bash
cd C:\Users\dell\.gemini\antigravity\scratch\azure-case-study
```

---

## Step 2: Initialize Git Repository

Initialize Git locally:

```bash
git init
```

Set default branch name to `main`:

```bash
git branch -M main
```

---

## Step 3: Add Files and Commit

Add all files (your `.gitignore` will ensure temporary terraform files are ignored):

```bash
git add .
```

Commit your changes:

```bash
git commit -m "feat: initial commit for Azure Production Infrastructure case study"
```

---

## Step 4: Create a New Repository on GitHub

1. Go to [GitHub - New Repository](https://github.com/new).
2. Enter a repository name (e.g., `azure-production-infrastructure-case-study`).
3. Set visibility to **Public** or **Private**.
4. **Do NOT check** "Initialize this repository with a README" (since we already have local files).
5. Click **Create repository**.

---

## Step 5: Link Remote & Push

Copy the repository URL from GitHub and run:

```bash
# Replace YOUR_USERNAME and REPO_NAME with your GitHub details
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push to GitHub
git push -u origin main
```

---

## Alternative: Using GitHub CLI (`gh`)

If you have GitHub CLI (`gh`) installed, you can create and push in one command:

```bash
gh repo create azure-production-infrastructure-case-study --public --source=. --remote=origin --push
```
