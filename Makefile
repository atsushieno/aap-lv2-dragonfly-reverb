
PWD=$(shell pwd)
AAP_LV2_DIR=$(PWD)/external/aap-lv2

all: build-all

build-all: \
	build-aap-lv2 \
	get-dragonfly-reverb-deps \
	import-dragonfly-reverb-deps \
	build-java

build-aap-lv2:
	cd $(AAP_LV2_DIR) && make

## downloads

get-dragonfly-reverb-deps: dependencies/dragonfly-reverb-deps/dist/stamp

dependencies/dragonfly-reverb-deps/dist/stamp: android-dragonfly-reverb-binaries.zip
	mkdir -p dependencies/dragonfly-reverb-deps
	unzip android-dragonfly-reverb-binaries -d dependencies/dragonfly-reverb-deps/
	if [ ! -d app/src/main/cpp/symlinked-dist ] ; then \
		ln -s $(PWD)/dependencies/dragonfly-reverb-deps/dist app/src/main/cpp/symlinked-dist ; \
	fi
	touch dependencies/dragonfly-reverb-deps/dist/stamp

android-dragonfly-reverb-binaries.zip:
	wget https://github.com/atsushieno/android-native-audio-builders/releases/download/r8.4/android-dragonfly-reverb-binaries.zip

# Run importers

import-dragonfly-reverb-deps:
	./import-dragonfly-reverb-deps.sh

## Build utility

build-java:
	ANDROID_SDK_ROOT=$(ANDROID_SDK_ROOT) ./gradlew build
 
## update metadata

update-metadata:
	cd external/aap-lv2 && make build-lv2-importer
	external/aap-lv2/tools/aap-import-lv2-metadata/build/aap-import-lv2-metadata app/src/main/assets/lv2 app/src/main/res/xml

