
find_package(SDL2 CONFIG REQUIRED)

set(target sw)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE
    ${EDUKE32_SOURCE_DIR}/build/include
    ${EDUKE32_SOURCE_DIR}/glad/include
    ${EDUKE32_SOURCE_DIR}/mact/include
    ${EDUKE32_SOURCE_DIR}/audiolib/include
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
    actor.cpp
    ai.cpp
    anim.cpp
    bldscript.cpp
    border.cpp
    break.cpp
    brooms.cpp
    bunny.cpp
    cache.cpp
    cheats.cpp
    colormap.cpp
    common.cpp
    config.cpp
    console.cpp
    coolg.cpp
    coolie.cpp
    copysect.cpp
    demo.cpp
    draw.cpp
    eel.cpp
    game.cpp
    girlninj.cpp
    goro.cpp
    grpscan.cpp
    hornet.cpp
    interp.cpp
    interpsh.cpp
    interpso.cpp
    inv.cpp
    jbhlp.cpp
    jnstub.cpp
    jplayer.cpp
    jsector.cpp
    jweapon.cpp
    lava.cpp
    light.cpp
    mclip.cpp
    mdastr.cpp
    menus.cpp
    miscactr.cpp
    morph.cpp
    network.cpp
    ninja.cpp
    panel.cpp
    player.cpp
    predict.cpp
    quake.cpp
    ripper.cpp
    ripper2.cpp
    rooms.cpp
    rotator.cpp
    rts.cpp
    save.cpp
    saveable.cpp
    scrip2.cpp
    sector.cpp
    serp.cpp
    setup.cpp
    skel.cpp
    skull.cpp
    slidor.cpp
    sounds.cpp
    spike.cpp
    sprite.cpp
    # startgtk.game.cpp
    # startwin.game.cpp
    sumo.cpp
    swconfig.cpp
    sync.cpp
    text.cpp
    track.cpp
    vator.cpp
    vis.cpp
    wallmove.cpp
    warp.cpp
    weapon.cpp
    zilla.cpp
    zombie.cpp
)
