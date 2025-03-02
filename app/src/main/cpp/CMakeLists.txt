cmake_minimum_required(VERSION 3.6.0)

add_library(aap-dragonfly-reverb SHARED
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

find_package (androidaudioplugin REQUIRED CONFIG)
target_link_libraries(aap-dragonfly-reverb
        android
        log
        androidaudioplugin::androidaudioplugin
)

# uncomment this if you want to enable AddressSanitizer
#set_target_properties(aap-dragonfly-reverb PROPERTIES LINK_FLAGS -fsanitize=address)
