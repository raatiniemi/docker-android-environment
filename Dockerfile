FROM openjdk:8
LABEL maintainer="Tobias Raatiniemi <raatiniemi@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_TOOLS_ZIP sdk-tools-linux-4333796.zip

COPY bin/install-sdk /bin

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends \
    && install-sdk \
    && yes | ${ANDROID_HOME}/tools/bin/sdkmanager tools \
    && yes | ${ANDROID_HOME}/tools/bin/sdkmanager platform-tools

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
