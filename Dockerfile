# Multi-stage Dockerfile: build Rust binary, run Python server

# Builder: compile Rust release binary
FROM rust:1.76 as builder
WORKDIR /app
# Copy manifest and source
COPY Cargo.toml ./
COPY main.rs ./
# Build release (creates target/release/trig_verifier)
RUN mkdir -p src && \
    # create a minimal src to satisfy cargo layout if needed
    true
RUN cargo build --release

# Runner: small Python base image to run the Python HTTP server and binary
FROM python:3.12-slim
WORKDIR /app
# Copy the compiled binary from the builder
COPY --from=builder /app/target/release/trig_verifier /app/trig_verifier
# Copy Python server
COPY server.py /app/server.py
# Ensure executable
RUN chmod +x /app/trig_verifier
EXPOSE 8081
ENV PORT=8081
CMD ["python", "server.py"]
