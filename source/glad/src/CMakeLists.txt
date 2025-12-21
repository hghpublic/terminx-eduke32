

set(target glad)
add_library(${target})
target_compile_features(${target} PRIVATE cxx_std_26)
target_include_directories(${target} PRIVATE
    ${PROJECT_SOURCE_DIR}/include
)
target_sources(${target} PRIVATE
    glad.c
    # glad_wgl.c
)
