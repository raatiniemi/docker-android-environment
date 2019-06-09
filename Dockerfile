FROM openjdk:8
LABEL maintainer="Tobias Raatiniemi <raatiniemi@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_TOOLS_ZIP sdk-tools-linux-4333796.zip

COPY bin/setup-prerequisite /bin
COPY bin/install-sdk /bin

RUN set -x \
    && setup-prerequisite \
    && install-sdk \
    && yes | ${ANDROID_HOME}/tools/bin/sdkmanager tools \
    && yes | ${ANDROID_HOME}/tools/bin/sdkmanager platform-tools

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
