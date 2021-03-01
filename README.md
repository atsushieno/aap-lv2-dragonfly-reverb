# aap-lv2-dragonfly-reverb: Dragonfly-Reverb ported to Android Audio Plugin

It is a port of [Dragonfly-Reverb](https://github.com/michaelwillis/dragonfly-reverb) to [AAP](https://github.com/atsushieno/android-audio-plugin-framework/). It is powered by LV2 using [aap-lv2](https://github.com/atsushieno/aap-lv2/).

## Building

`make` should take care of the builds. See [GitHub Actions script](.github/workflows/actions.yml) for further normative setup.

At this state, it downloads prebuilt dragonfly-reverb binaries from [android-native-audio-builders](https://github.com/atsushieno/android-native-audio-builders) release artifacts. We are not sure if we change that - DPF is not CMake ready.


## Licensing notice

aap-lv2-dragonfly-reverb codebase is distributed under the GPL v3 license.

LV2 (repository for the headers) is under the ISC license.

Dragonfly-Reverb is distributed under the GPL v3 license.

The entire plugin application bundles `androidaudioplugin-lv2` AAR module from `aap-lv2`, and `androidaudioplugin` AAR module, and is packaged into one application.
