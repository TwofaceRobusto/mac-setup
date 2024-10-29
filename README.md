# mac-setup

Scripts to help install software on macOS

* oh my zsh
* homebrew
* sdkman

## Install

Path: ``scripts/setup``

Scripts to install

* homebrew
* oh my zsh
* sdkman

### Homebrew

Path: ``scripts/setup/homebrew``

#### homebrewBase.sh

Installs a base selection of programs:

* Formulae
    * bat
    * btop
    * coreutils
    * fastfetch
    * lsd
    * podman
    * qrencode
    * shellcheck
    * tree
    * typst
* Casks
    * quba
    * iina
    * mediathekview
    * devtoys
    * podman-desktop

#### uninstallAllHomebrewFormulae.sh

Uninstalls all installed formuale.

### sdkman

Path: ``scripts/setup/sdkman``

#### sdkmanBase.sh

Installs a base selection of SDKs with the specified versions:

* java 21.0.4-tem
* maven 3.9.9
* gradle 8.10.2
* kotlin 2.0.21
* quarkus 3.15.1

#### listAllinstalledSdk.sh

Lists all installed versions of the specified SDKs:

* java
* maven
* gradle
* kotlin
* quarkus

#### deleteAllUnusedSdk.sh

Deletes all installed versions of the specified SDKs except the version currently in use:

* java
* maven
* gradle
* kotlin
* quarkus

### oh-my-zsh

Path: ``scripts/setup/omz``

* installTheme.sh : installs teh kotik4 zsh theme

## Update

Path: ``scripts/update``

Update scripts for oh my zsh, homebrew and sdkman

* updateHomebrew.sh
* updateOmz.sh
* updateSdk.sh
* updateAll.sh

## system

Path: ``scripts/system``

Helper scripts to

* show configured hostnames
* change hostnames
* show loggedIn user
* show macOS version
* show stored WiFi password (in keychain) for a given WiFi network; will ask for credentials

