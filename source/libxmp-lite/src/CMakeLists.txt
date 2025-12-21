
# find_package(SDL2 CONFIG REQUIRED)

set(target libxmp-lite)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE
    ${PROJECT_SOURCE_DIR}/include/libxmp-lite
    ${EDUKE32_SOURCE_DIR}/build/include
    # ${EDUKE32_SOURCE_DIR}/glad/include
    # ${EDUKE32_SOURCE_DIR}/audiolib/include
)
target_compile_definitions(${target} PRIVATE
    LIBXMP_NO_PROWIZARD
    LIBXMP_CORE_PLAYER
)
# if(SDL2_FOUND)
# message(STATUS "SDL2_VERSION ${SDL2_VERSION}")
# message(STATUS "SDL2_VERSION_MAJOR: ${SDL2_VERSION_MAJOR}")
# message(STATUS "SDL2_VERSION_MINOR: ${SDL2_VERSION_MINOR}")
# target_compile_definitions(${target} PRIVATE SDL_MAJOR_VERSION=${SDL2_VERSION_MAJOR})
# endif()
# target_link_libraries(${target}
#     PRIVATE
#     $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
#     $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
# )

target_sources(${target} PRIVATE
    common.c
    control.c
    dataio.c
    effects.c
    filter.c
    format.c
    hio.c
    it_load.c
    itsex.c
    lfo.c
    load.c
    load_helpers.c
    memio.c
    mix_all.c
    mixer.c
    mod_load.c
    mtm_load.c
    period.c
    player.c
    read_event.c
    s3m_load.c
    sample.c
    scan.c
    smix.c
    virtual.c
    win32.c
    xm_load.c
)
