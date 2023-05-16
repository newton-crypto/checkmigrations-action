# checkmigrations-action
A GitHub Action used to run a lightweight database migration files check on a repository. What this means is this does not require any database connection to run. It simply checks if the migration files are in sync with the main branch. This is useful for CI/CD pipelines to ensure that the migration files are in sync with the main branch without needing to set up the app to run the migration commands for the given framework. 

## More about the main CLI used 
This project is leveraging a cli written in Rust which you can view [here](https://github.com/jdboisvert/checkmigrations)

## Example 
```yaml
name: Check Migrations

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  check_migrations:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout repository
      uses: actions/checkout@v3
      with:
          fetch-depth: 0

    # This part is important if you wish to run this action against a base branch. 
    - name: Merge base branch
      if: github.event_name == 'pull_request'
      run: |
        git fetch origin ${{ github.base_ref }}
        git checkout -b temp-merge-branch
        git branch -u origin/${{ github.base_ref }}
        git pull --no-ff --no-edit || true

    # This runs the actual lightweight check
    - name: Run Check Migrations Action
      uses: jdboisvert/checkmigrations-action@main
      with:
        framework: 'django'
        path: 'path/to/app'
```