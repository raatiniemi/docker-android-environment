FROM raatiniemi/gradle:latest
MAINTAINER Tobias Raatiniemi <raatiniemi@gmail.com>

ENV ANDROID_SDK_VERSION 25.2.2
ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_TOOLS_ZIP tools_r${ANDROID_SDK_VERSION}-linux.zip

RUN set -x \
    && dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -yq libstdc++6:i386 zlib1g:i386 libncurses5:i386 --no-install-recommends \
    && mkdir -p "${ANDROID_HOME}" \
    && curl -O -Ls http://dl.google.com/android/repository/${ANDROID_TOOLS_ZIP} \
    && unzip -qq ${ANDROID_TOOLS_ZIP} -d "${ANDROID_HOME}" && rm ${ANDROID_TOOLS_ZIP} \
    && echo 'y' | ${ANDROID_HOME}/tools/android update sdk -u -a -t \
            tools,platform-tools,build-tools-24.0.0,build-tools-23.0.3 \
    && echo 'y' | ${ANDROID_HOME}/tools/android update sdk -u -a -t \
            android-25,android-24,android-23,android-22,android-21,android-19,android-18,android-17,android-16 \
    && echo 'y' | ${ANDROID_HOME}/tools/android update sdk -u -a -t \
            extra-android-support,extra-android-m2repository

ENV PATH $PATH:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
