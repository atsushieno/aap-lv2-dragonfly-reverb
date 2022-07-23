# Sets the minimum version of CMake required to build your native library.
# This ensures that a certain set of CMake features is available to
# your build.

cmake_minimum_required(VERSION 3.6.0)

# Specifies a library name, specifies whether the library is STATIC or
# SHARED, and provides relative paths to the source code. You can
# define multiple libraries by adding multiple add_library() commands,
# and CMake builds them for you. When you build your app, Gradle
# automatically packages shared libraries with your APK.

add_library( # Specifies the name of the library.
        aap-dragonfly-reverb

        # Sets the library as a shared library.
        SHARED

        # Provides a relative path to your source file(s).
        "dummy.cpp"
        )

target_include_directories(aap-dragonfly-reverb
        PRIVATE
        "${Project_SOURCE_DIR}/../../../include"
        )

target_compile_options(aap-dragonfly-reverb
        PRIVATE
        -std=c++17
        -Wall
        -Wextra-semi
        -Wshadow
        -Wshadow-field
        )

target_link_libraries(aap-dragonfly-reverb android log)

if (BUILD_WITH_PREFAB)
if (ANDROID)
    find_package (androidaudioplugin REQUIRED CONFIG)
    set (aap-dragonfly-reverb_LIBS
            android
            log
            androidaudioplugin::androidaudioplugin)
else (ANDROID)
    set (aap-dragonfly-reverb_LIBS)
endif (ANDROID)
target_link_libraries(aap-dragonfly-reverb ${aap-dragonfly-reverb_LIBS})
else ()
target_link_libraries(aap-dragonfly-reverb android log)
endif ()

# uncomment this if you want to enable AddressSanitizer
#set_target_properties(aap-dragonfly-reverb PROPERTIES LINK_FLAGS -fsanitize=address)
