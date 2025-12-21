# https://cmake.org/cmake/help/latest/module/FindSDL.html
find_package(SDL2 CONFIG REQUIRED)

set(target mact)
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
    ${EDUKE32_SOURCE_DIR}/build/include
    # ${EDUKE32_SOURCE_DIR}/voidwrap/include
    ${EDUKE32_SOURCE_DIR}/glad/include
    # ${EDUKE32_SOURCE_DIR}/imgui/include
)
target_link_libraries(${target}
    PRIVATE
    $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
    $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
)
target_sources(${target} PRIVATE
    animlib.cpp
    control.cpp
    joystick.cpp
    keyboard.cpp
    scriplib.cpp
)
