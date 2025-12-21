# https://cmake.org/cmake/help/latest/module/FindSDL.html
find_package(SDL2 CONFIG REQUIRED)

set(target build)
add_library(${target})
if(SDL2_FOUND)
message(STATUS "SDL2_VERSION ${SDL2_VERSION}")
message(STATUS "SDL2_VERSION_MAJOR: ${SDL2_VERSION_MAJOR}")
message(STATUS "SDL2_VERSION_MINOR: ${SDL2_VERSION_MINOR}")
target_compile_definitions(${target} PRIVATE SDL_MAJOR_VERSION=${SDL2_VERSION_MAJOR})
endif()
target_compile_definitions(${target} PRIVATE NOASM)
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE
    ${PROJECT_SOURCE_DIR}/include
    # ${EDUKE32_SOURCE_DIR}/voidwrap/include
    ${EDUKE32_SOURCE_DIR}/glad/include
    ${EDUKE32_SOURCE_DIR}/imgui/include
)
target_link_libraries(${target}
    PRIVATE
    $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
    $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
)

# cpp source files

target_sources(${target} PRIVATE
    2d.cpp
    a-c.cpp
    animvpx.cpp
    baselayer.cpp
    build.cpp
    cache1d.cpp
    clip.cpp
    colmatch.cpp
    common.cpp
    # # communityapi.cpp
    compat.cpp
    config.cpp
    cpuid.cpp
    crc32.cpp
    defs.cpp
    dxtfilter.cpp
    # dynamicgtk.cpp
    enet.cpp
    engine.cpp
    fix16.cpp
    glbuild.cpp
    # # glsurface.cpp
    # gtkbits.cpp
    hash.cpp
    hightile.cpp
    klzw.cpp
    kplib.cpp
    loguru.cpp
    # # lz4.cpp
    md4.cpp
    mdsprite.cpp
    mhk.cpp
    mmulti.cpp
    mutex.cpp
    osd.cpp
    palette.cpp
    pngwrite.cpp
    polymer.cpp
    polymost.cpp
    pragmas.cpp
    # rawinput.cpp
    rev.cpp
    screenshot.cpp
    screentext.cpp
    scriptfile.cpp
    sdlayer.cpp
    # sdlayer12.cpp
    sdlkeytrans.cpp
    sjson.cpp
    smalltextfont.cpp
    smmalloc.cpp
    smmalloc_generic.cpp
    smmalloc_tls.cpp
    softsurface.cpp
    # startgtk.editor.cpp
    # startwin.editor.cpp
    texcache.cpp
    textfont.cpp
    tilepacker.cpp
    tiles.cpp
    timer.cpp
    vfs.cpp
    voxmodel.cpp
    # wiibits.cpp
    # winbits.cpp
    # winlayer.cpp
)

# c source files

target_sources(${target} PRIVATE
    lz4.c
    miniz.c
    miniz_tdef.c
    miniz_tinfl.c
    xxhash.c
)
