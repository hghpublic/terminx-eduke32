
find_package(SDL2 CONFIG REQUIRED)

set(target imgui)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE ${PROJECT_SOURCE_DIR}/include)
target_link_libraries(${target}
    PRIVATE
    $<TARGET_NAME_IF_EXISTS:SDL2::SDL2main>
    $<IF:$<TARGET_EXISTS:SDL2::SDL2>,SDL2::SDL2,SDL2::SDL2-static>
)
target_sources(${target} PRIVATE
    imgui.cpp
    imgui_demo.cpp
    imgui_draw.cpp
    imgui_impl_opengl3.cpp
    imgui_impl_sdl2.cpp
    # imgui_impl_win32.cpp
    imgui_tables.cpp
    imgui_widgets.cpp
)
