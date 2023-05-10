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

    - name: Run Check Migrations Action
      uses: jdboisvert/checkmigrations-action@main
      with:
        framework: 'django'
        path: 'path/to/app'
```