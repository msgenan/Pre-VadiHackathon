FROM node:20-alpine

# system tools
RUN apk add --no-cache \
    python3 \
    py3-pip \
    py3-pytest \
    curl \
    bash

# newman
RUN npm install -g newman

WORKDIR /tests

COPY run-tests.sh /tests/run-tests.sh
RUN chmod +x /tests/run-tests.sh

VOLUME ["/backend", "/frontend", "/tests"]

ENTRYPOINT ["/tests/run-tests.sh"]
