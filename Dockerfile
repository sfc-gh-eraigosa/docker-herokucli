ARG BASE_IMAGE=node:8.12.0-alpine
FROM $BASE_IMAGE

ARG TAG=1
ARG DOCKER_IMAGE=herokucli

ENV TAG=${TAG}
ENV DOCKER_IMAGE=${DOCKER_IMAGE}

RUN echo "Working on ${DOCKER_IMAGE}:${TAG}"
RUN echo "Installing git and herokucli cli"   \
    && mkdir /workspace                    \
    && apk add --no-cache git              \
    && apk add --no-cache bash             \
    && apk add --no-cache build-base       \
    && npm install -g heroku               \
    && apk del build-base

RUN echo "Setting up travis user"          \
    && addgroup -S heroku -g 19998         \
    && adduser -S -g heroku -u 1998 heroku

COPY entrypoint.sh /bin/entrypoint
COPY profile.sh /etc/profile.d/profile.sh
RUN chmod +x /bin/entrypoint
RUN /bin/entrypoint test

WORKDIR /workspace

USER heroku

ENTRYPOINT ["/bin/entrypoint"]
