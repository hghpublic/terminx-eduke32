
find_package(SDL2 CONFIG REQUIRED)

set(target duke3d)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE
    ${EDUKE32_SOURCE_DIR}/build/include
    ${EDUKE32_SOURCE_DIR}/glad/include
    ${EDUKE32_SOURCE_DIR}/audiolib/include
    ${EDUKE32_SOURCE_DIR}/mact/include
)
if(SDL2_FOUND)
message(STATUS "SDL2_VERSION ${SDL2_VERSION}")
message(STATUS "SDL2_VERSION_MAJOR: ${SDL2_VERSION_MAJOR}")
message(STATUS "SDL2_VERSION_MINOR: ${SDL2_VERSION_MINOR}")
target_compile_definitions(${target} PRIVATE SDL_MAJOR_VERSION=${SDL2_VERSION_MAJOR})
endif()
target_compile_definitions(${target} PRIVATE NOASM)
target_link_libraries(${target}
    PRIVATE
    $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
    $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
)


target_sources(${target} PRIVATE
    actors.cpp
    anim.cpp
    # astub.cpp
    cheats.cpp
    cmdline.cpp
    common.cpp
    config.cpp
    demo.cpp
    dnames.cpp
    game.cpp
    gamedef.cpp
    gameexec.cpp
    gamestructures.cpp
    gamevars.cpp
    global.cpp
    grpscan.cpp
    # in_android.cpp
    input.cpp
    m32common.cpp
    # m32def.cpp
    # m32exec.cpp
    m32structures.cpp
    # m32vars.cpp
    # mdump.cpp
    menus.cpp
    network.cpp
    osdcmds.cpp
    osdfuncs.cpp
    player.cpp
    premap.cpp
    rts.cpp
    savegame.cpp
    sbar.cpp
    screens.cpp
    sector.cpp
    sounds.cpp
    sounds_mapster32.cpp
    # startgtk.game.cpp
    # startwin.game.cpp
    text.cpp
    winbits.cpp
)
