# Docker container for building Android applications

## Usage
Two images are available. The standard image use JDK 7, and the alternative
image use the JDK 8. On top of these base images, the Android SDK with build and
platform tools are added, aswell as common Android APIs and support libraries.

* `raatiniemi/android-environment:latest` (with JDK 7)
* `raatiniemi/android-environment:latest-jdk-8` (with JDK 8)
