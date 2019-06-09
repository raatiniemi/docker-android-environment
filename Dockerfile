FROM debian:stretch AS builder
WORKDIR /build
COPY bin/configure-builder .
RUN set -x && ./configure-builder

FROM openjdk:8
LABEL maintainer="Tobias Raatiniemi <raatiniemi@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk

COPY bin/install-base-container /bin
COPY bin/install-via-sdkmanager /bin
COPY --from=builder /build/android ${ANDROID_HOME}

RUN set -x && install-base-container \
  && rm bin/install-base-container

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
