FROM rust:latest

# Install your CLI tool
RUN cargo install checkmigrations --git https://github.com/jdboisvert/checkmigrations.git

# Set the entrypoint for your action
ENTRYPOINT ["checkmigrations"]
