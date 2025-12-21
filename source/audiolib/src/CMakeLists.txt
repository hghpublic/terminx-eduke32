find_package(SDL2 CONFIG REQUIRED)

set(target audiolib)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
if(SDL2_FOUND)
message(STATUS "SDL2_VERSION ${SDL2_VERSION}")
message(STATUS "SDL2_VERSION_MAJOR: ${SDL2_VERSION_MAJOR}")
message(STATUS "SDL2_VERSION_MINOR: ${SDL2_VERSION_MINOR}")
target_compile_definitions(${target} PRIVATE SDL_MAJOR_VERSION=${SDL2_VERSION_MAJOR})
endif()
target_compile_definitions(${target} PRIVATE RENDERTYPESDL)
target_include_directories(${target} PRIVATE
    ${PROJECT_SOURCE_DIR}/include
    ${EDUKE32_SOURCE_DIR}/build/include
)
target_link_libraries(${target}
    PRIVATE
    $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
    $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
)
target_sources(${target} PRIVATE
    driver_adlib.cpp
    driver_alsa.cpp
    # driver_directsound.cpp
    driver_sdl.cpp
    driver_sf2.cpp
    # driver_winmm.cpp
    drivers.cpp
    flac.cpp
    formats.cpp
    fx_man.cpp
    gmtimbre.cpp
    midi.cpp
    mix.cpp
    mixst.cpp
    multivoc.cpp
    music.cpp
    # music_external.cpp
    opl3.cpp
    pitch.cpp
    vorbis.cpp
    xa.cpp
    xmp.cpp
)
