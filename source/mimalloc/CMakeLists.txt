cmake_minimum_required(VERSION 4.2)

# https://microsoft.github.io/mimalloc/
project(mimalloc
    VERSION 0.1.0
    DESCRIPTION "mimalloc is a compact general purpose allocator with \
excellent performance."
    HOMEPAGE_URL https://github.com/microsoft/mimalloc
    LANGUAGES C
)

add_subdirectory(src)
