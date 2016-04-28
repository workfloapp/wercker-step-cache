# Wercker cache step
[Wercker](https://wercker.com) step to store and restore directories between builds.
You can use this to cache Maven, SBT, Ivy dependency repository to speed up the
step when the build tool "Download the whole internet"

![Oh look Maven downloading internet](maven-download-internet.png "Oh look Maven downloading internet")

# Options

- `action` Either "store" or "restore"
- `directories` (optional) Space separated list of directories in home directory to cache. Default: `.m2 .ivy2 .sbt`

# Example
```yaml
build:
  steps:
    - ernoaapa/cache:
      name: "Restore dependencies from cache"
      action: restore

    # ... your steps here ...

    - ernoaapa/cache:
      name: "Store dependencies to cache"
      action: store
```
# License
The MIT License (MIT)

# Changelog
## 0.2.0
- Fixed the script

## 0.1.0
- Initial release
