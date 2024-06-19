FROM public.ecr.aws/newton/rust

# Install your CLI tool
RUN cargo install checkmigrations --git https://github.com/newton-crypto/checkmigrations.git

# Set the entrypoint for your action
ENTRYPOINT ["checkmigrations"]
