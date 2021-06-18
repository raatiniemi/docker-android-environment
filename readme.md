# android-environment

[![GPLv3 license](https://img.shields.io/badge/license-GPLv3-blue.svg)](license)
[![Pipeline status](https://gitlab.com/rahome/docker-android-environment/badges/master/pipeline.svg)](https://gitlab.com/rahome/docker-android-environment/)

Docker container image for building Android applications in an CI/CD pipeline.
There are two variants of the image, one that use OpenJDK 8 as the base (which
is the default) and another that use OpenJDK 11 (specified via tag name).

## Usage

The [container image is available at Docker Hub](https://hub.docker.com/r/raatiniemi/android-environment/)
via `raatiniemi/android-environment:jdk-8-latest` (or
`raatiniemi/android-environment:jdk-11-latest` for projects using JDK 11).

The container image comes preinstalled with:

* Android tools SDK
* Platform tools

[All the available tags are found at Docker Hub](https://hub.docker.com/repository/docker/raatiniemi/android-environment/tags).

### Install additional Android tools

In order to install additional Android tools the use of `sdkmanager` is
recommended, and when using the `sdkmanager` the license must be accepted.

The following is a sample script for installing the `build-tools` aswell as a
version of the Android API.

```bash
function accept_license_and_install {
  yes | sdkmanager $1 1>/dev/null;
  if [ $? -ne 0 ]; then
    echo "Failed to accept license and install ${1}";
    exit 1;
  fi
}

accept_license_and_install "build-tools;27.0.3";
accept_license_and_install "platforms;android-27";
```

### Preinstalled Android API

In an effort to reduce build time in an CI/CD pipeline, there is a version
available where the Android API have been preinstalled.

This version is available using another tag, e.g.:

* `android-28-latest` for the Android API 28 preinstalled,
  **deprecated use `jdk-8-android-28-latest` instead**.
* `android-29-latest` for the Android API 29 preinstalled,
  **deprecated use `jdk-8-android-29-latest` instead**.
* `android-30-latest` for the Android API 30 preinstalled,
  **deprecated use `jdk-8-android-30-latest` instead**.
* `jdk-8-android-28-latest` for the Android API 28 preinstalled *with OpenJDK 8 as base*.
* `jdk-8-android-29-latest` for the Android API 29 preinstalled *with OpenJDK 8 as base*.
* `jdk-8-android-30-latest` for the Android API 30 preinstalled *with OpenJDK 8 as base*.
* `jdk-11-android-28-latest` for the Android API 28 preinstalled *with OpenJDK 11 as base*.
* `jdk-11-android-29-latest` for the Android API 29 preinstalled *with OpenJDK 11 as base*.
* `jdk-11-android-30-latest` for the Android API 30 preinstalled *with OpenJDK 11 as base*.

*The build tools are not installed since these are installed when the
`gradlew` command is executed.*
