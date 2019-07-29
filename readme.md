# android-environment

[![Docker Automated build](https://img.shields.io/docker/automated/raatiniemi/android-environment.svg)](https://hub.docker.com/r/raatiniemi/android-environment/)
[![Docker Build Status](https://img.shields.io/docker/build/raatiniemi/android-environment.svg)](https://hub.docker.com/r/raatiniemi/android-environment/)
[![Docker Pulls](https://img.shields.io/docker/pulls/raatiniemi/android-environment.svg)](https://hub.docker.com/r/raatiniemi/android-environment/)

Docker container for building Android applications in an CI/CD pipeline. The
container comes preinstalled with:

* Android tools SDK
* Platform tools

Both the Android build tools and APIs have to be manually installed using the
`sdkmanager` to reduce image size since not all applications have the same needs.

## Usage

The [container image is available at Docker Hub](https://hub.docker.com/r/raatiniemi/android-environment/)
via `raatiniemi/android-environment:latest`.

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
