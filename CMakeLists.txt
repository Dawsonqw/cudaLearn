cmake_minimum_required(VERSION 3.20)
project(cuda_project VERSION 0.1.0 LANGUAGES CXX CUDA C)


if (NOT DEFINED CMAKE_CUDA_ARCHITECTURES)
    set(CMAKE_CUDA_ARCHITECTURES native)
endif()

set(CMAKE_BUILD_TYPE DEBUG)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(CheckLanguage)
check_language(CUDA)

if(NOT CUDAToolkit_FOUND)
    include(FindCUDAToolkit)
endif()

include_directories(${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES})

find_package(CUDA REQUIRED)

add_subdirectory(reduce_project)
