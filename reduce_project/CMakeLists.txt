# find_package(BLAS REQUIRED)

add_executable(reduce_project reduce.cu)
target_link_libraries(reduce_project PRIVATE CUDA::cudart ${CUDA_cublas_LIBRARY})

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(reduce_project PRIVATE $<$<COMPILE_LANGUAGE>:-G>)
endif()