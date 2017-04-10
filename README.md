## TWRP device tree for Xiaomi Redmi Note 2

Add to `.repo/local_manifests/hermes.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<project path="device/xiaomi/hermes" name="ccsysadmin/omni_twrp_hermes" remote="github" revision="android-5.1" groups="pdk" />
</manifest>
```

Then run `repo sync` to check it out.

To build:

```sh
. build/envsetup.sh
lunch omni_hermes-userdebug
mka -i -j 5 recoveryimage
```