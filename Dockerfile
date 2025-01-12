FROM scratch
ARG CHANGELOG
ARG DESCRIPTION

LABEL org.opencontainers.image.title="Docker Extension for Node-RED" \
    org.opencontainers.image.description="Low-code programming for event-driven applications" \
    org.opencontainers.image.vendor="MilkyWare" \
    com.docker.extension.additional-urls="[ \
    {\"title\": \"Node-RED\", \"url\": \"https://github.com/node-red/node-red\" }, \
    {\"title\": \"OpenJS Foundation\", \"url\": \"http://openjsf.org\" } \
    {\"title\": \"Flowchart\", \"url\": \"https://iconscout.com/icons/flowchart\" } \
    {\"title\": \"Arslan Haider\", \"url\": \"https://iconscout.com/contributors/arslan-haider\" } \
    ]" \
    com.docker.desktop.extension.api.version=">= 0.3.4" \
    com.docker.extension.categories="javascript,low-code,flow-based-programming" \
    com.docker.desktop.extension.icon=https://raw.githubusercontent.com/milkyware/node-red-docker-extension/bcfc1ea776422d78ece65d95b28655cb66f06e4f/icon.svg \
    com.docker.extension.changelog="$CHANGELOG" \
    com.docker.extension.detailed-description="$DESCRIPTION" \
    com.docker.extension.publisher-url="https://github.com/milkyware/node-red-docker-extension" \
    com.docker.extension.screenshots="[ \
    {\"url\": \"https://raw.githubusercontent.com/milkyware/node-red-docker-extension/refs/heads/main/screenshots/screenshot1.png\", \"alt\": \"screenshot1\"} \
    ]"

COPY ui ui
COPY docker-compose.yml .
COPY metadata.json .
COPY icon.svg .