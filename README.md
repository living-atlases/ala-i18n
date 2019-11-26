# ala-i18n

## Introduction

Translations of ALA modules is something crucial for non-English countries in the LA community but something of low priority for English countries.

This is a proposal for a better and faster management of translations in LA.

This repo is used to maintain, package and install ALA translations in `/opt/atlas/<appname>/i18n/messages*` directories of our servers up-to-date with crowdin.

This follows the `/opt/atlas` usage of `CAS` and new `images-service` version.

## Packaging

We create an unique debian package like `ala-i18n` with all the apps translations together to simplify (also we can use [alien](https://wiki.debian.org/Alien) to generate an equivalent RHEL package) and we add it to a debian public repo (see below).

This internationalization package is automatically build and released on each crowdin finished translation and will be quite independent of ALA apps releases.

With this proposal, all servers that need translations installs and update the `ala-i18n` package. If that server has only the collectory module, will only use `/opt/atlas/i18n/collectory/messages*` of ala-i18n package.

## Install

You can test this package using this apt repository:

```
echo "deb [arch=amd64] https://demo.gbif.es/repo bionic main" > /etc/apt/sources.list.d/ala.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F697D8D2ADB9E24A
apt update
apt install ala-i18n
dpkg -L ala-i18n
```

## Build

You can manually generate this package with:

```
debuild -us -uc -b
```

See `debian` directory for more details.

## Continuous integration

Currently this package is generated and published automatically in the above apt repository using some jenkins job. This job is automatically launched on each crowdin finished translation. The upload of sources and new messages translations from github to crowdin is also automatized in other job.

We can share these job configurations with ALA team, if they want to take care of this build process.

We can share also the webhook that launchs this job with other portals, if they want to launch it manually for any reason, and generate a new debian package in some minutes with new translations.

## Resources precedence

To use these translations, each ALA app should search for (with precedence):

```
# custom messages files in (can be created/edited by node developers)
/var/opt/atlas/i18n/<app-name>/message*
# ala-i18n packaged & installed translations
# (should not be modified my node developers):
/opt/atlas/i18n/<app-name>/message*
# currently packaged i18n resources
/var/lib/tomcat7/webapp*
```

So [we are updating each ALA app](https://github.com/search?q=is%3Apr+author%3Avjrj+org%3AAtlasOfLivingAustralia+ala-i18n&type=Issues) for this. With these PRs merged and with your ALA site updated (with them), you can maintain your site translations up-to-date.
