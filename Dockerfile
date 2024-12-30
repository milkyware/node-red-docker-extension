FROM scratch
ARG CHANGELOG

LABEL org.opencontainers.image.title="Node-RED" \
    org.opencontainers.image.description="Low-code programming for event-driven applications" \
    org.opencontainers.image.vendor="NodeRED" \
    com.docker.desktop.extension.api.version=">= 0.3.4" \
    com.docker.desktop.extension.icon=https://raw.githubusercontent.com/milkyware/node-red-docker-extension/refs/heads/main/node-red.svg \
    com.docker.extension.categories="development,logs" \
    com.docker.extension.changelog="$CHANGELOG" \
    com.docker.extension.detailed-description="Docker Extension for Node-RED" \
    com.docker.extension.publisher-url="https://github.com/milkyware/node-red-docker-extension" \
    com.docker.extension.screenshots="[ \
    {\"url\": \"https://raw.githubusercontent.com/milkyware/node-red-docker-extension/refs/heads/main/screenshots/screenshot1.png\", \"alt\": \"screenshot1\"} \
    ]"

COPY ui ui
COPY docker-compose.yml .
COPY metadata.json .
COPY node-red.svg .