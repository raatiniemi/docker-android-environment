FROM openjdk:8
LABEL maintainer="Tobias Raatiniemi <raatiniemi@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk

COPY bin/setup-prerequisite /bin
COPY bin/install-sdk /bin
COPY bin/install-via-sdkmanager /bin

RUN set -x \
    && setup-prerequisite \
    && install-sdk \
    && install-via-sdkmanager tools \
    && install-via-sdkmanager platform-tools

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
