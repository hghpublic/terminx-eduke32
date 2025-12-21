
find_package(SDL2 CONFIG REQUIRED)

set(target kenbuild)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE
    ${EDUKE32_SOURCE_DIR}/build/include
    ${EDUKE32_SOURCE_DIR}/glad/include
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
    bstub.cpp
    common.cpp
    config.cpp
    game.cpp
    kdmeng.cpp
    sound_stub.cpp
    # startgtk.game.cpp
    # startwin.game.cpp
)
