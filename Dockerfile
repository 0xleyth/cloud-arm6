FROM arm32v6/alpine:latest

# Install necessary packages
RUN apk add --no-cache curl

# Install cloudflared
RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm -o /usr/local/bin/cloudflared \
    && chmod +x /usr/local/bin/cloudflared

# Verify the installation
RUN /usr/local/bin/cloudflared --version

# Set the entrypoint to cloudflared
ENTRYPOINT ["/usr/local/bin/cloudflared"]

# Default command
CMD ["--help"]
