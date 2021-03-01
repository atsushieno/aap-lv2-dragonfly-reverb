#!/bin/bash

AAP_LV2_DIR=external/aap-lv2/
ABIS_SIMPLE=(x86 x86_64 armeabi-v7a arm64-v8a)

# Remove existing jniLibs for sanity
rm -rf app/src/main/jniLibs/

for abi in ${ABIS_SIMPLE[*]}
do
    echo "ABI: $abi"
    # copy native libs of LV2 plugins for each ABI.
    mkdir -p app/src/main/jniLibs/$abi
    cp -R dependencies/dragonfly-reverb-deps/dist/$abi/*/*.so app/src/main/jniLibs/$abi/
done

# Copy LV2 metadata files etc.
# The non-native parts should be the same so we just copy files from x86 build.
#
# Also, we only need `mda.lv2` here. Avoid copying those LV2 (SDK) files.
# But not that when you are copying this script, you should probably
# NOT name a specific plugin.
#
mkdir -p app/src/main/assets/lv2
cp -R dependencies/dragonfly-reverb-deps/dist/x86/*.lv2 app/src/main/assets/lv2/
# ... except for *.so files. They are stored under jniLibs.
rm app/src/main/assets/lv2/*/*.so

# Generate `aap-metadata.xml` that AAP service look up plugins.
mkdir -p app/src/main/assets/lv2
mkdir -p app/src/main/res/xml
$AAP_LV2_DIR/tools/aap-import-lv2-metadata/build/aap-import-lv2-metadata \
	app/src/main/assets/lv2 \
	app/src/main/res/xml

