FROM raatiniemi/gradle:latest-jdk-7
MAINTAINER Tobias Raatiniemi <raatiniemi@gmail.com>

ENV ANDROID_SDK_VERSION 24.4.1
ENV ANDROID_HOME /opt/android-sdk

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends \
    && mkdir -p "${ANDROID_HOME}" \
    && curl -Ls http://dl.google.com/android/android-sdk_r${ANDROID_SDK_VERSION}-linux.tgz \
        | tar -xz --directory "${ANDROID_HOME}" --strip-components=1 --no-same-owner \
    && echo 'y' | ${ANDROID_HOME}/tools/android update sdk -u -a -t \
            tools,platform-tools,build-tools-23.0.3 \
    && echo 'y' | ${ANDROID_HOME}/tools/android update sdk -u -a -t \
            android-23,android-22,android-21

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
