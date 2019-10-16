# ala-i18n

## Introduction

Translations of ALA modules is something crucial for non-English countries in the LA community but something of low priority for English countries.

This is a proposal for a better and faster management of translations in LA.

This repo is used to maintain, package and install ALA translations in `/opt/atlas/<appname>/i18n/messages*` directories of our servers up-to-date with crowdin.

This follows the `/opt/atlas` usage of `CAS` and new `images-service` version.

## Packaging

With this we can create an unique debian package like `ala-i18n` with all the apps translations together to simplify (also we can use [alien](https://wiki.debian.org/Alien) to generate an equivalent RHEL package) and add it to a debian public repo.

This internationalization package can be updated with a faster workflow and quite independent of ALA apps releases.

With this proposal, all servers that need translations installs `ala-i18n` package. If that server has only the collectory module, will only use `/opt/atlas/i18n/collectory/messages*` of ala-i18n package.

This unique package `ala-i18n` can be generated and build automatically via crowdin and debian package utils with few effort.

## Resources precedence

To use these translations, each app will search for (with precedence):

```
# custom messages files in (can be created/edited by node developers)
/var/opt/atlas/i18n/<app-name>/message*
# ala-i18n packaged & installed translations
# (should not be modified my node developers):
/opt/atlas/i18n/<app-name>/message*
# currently packaged i18n resources
/var/lib/tomcat7/webapp*
```
