cmake_minimum_required(VERSION 3.13)
project(ISTool)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake/)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++17 -Ofast")
add_definitions(-DDEBUG)

INCLUDE(FindPkgConfig)
include_directories(include)

#Z3
set(Z3_PATH /home/ztye/z3)
link_directories(${Z3_PATH}/build)
set(Z3_FILE /home/ztye/anaconda3/lib/python3.11/site-packages/z3/lib/libz3.so)
include_directories(${Z3_PATH}/src/api/c++)
include_directories(${Z3_PATH}/src/api)

#jsoncpp
set(Jsoncpp_LIBRARY /home/ztye/anaconda3/lib/libjsoncpp.so)
include_directories(/usr/include)

#glog
include_directories(/home/ztye/anaconda3/include)
link_directories(/home/ztye/anaconda3/lib)

#gurobi
set(GUROBI_PATH /home/ztye/gurobi1003/linux64)
include_directories(${GUROBI_PATH}/include)
link_directories(${GUROBI_PATH}/lib)
set(GUROBI_FILE libgurobi_g++5.2.a libgurobi100.so)

#Profiler
#option(USE_PROFILER "option for using libprofiler" OFF)
#if (USE_PROFILER)
#  add_definitions(-DPROFILER)
#  include_directories(${LIBPROFILER_INCLUDE_DIRS})
#  set(PROFILER_FILE ${LIBPROFILER_LIBRARIES})
#endif()
 
# libs
set(THIRDPARTY_LIBS glog gflags ${Jsoncpp_LIBRARY} ${Z3_FILE} ${GUROBI_FILE} ${PROFILER_FILE})

# subdic
add_subdirectory(basic)
add_subdirectory(ext)
add_subdirectory(sygus)
add_subdirectory(solver)
add_subdirectory(selector)
add_subdirectory(dsl)
add_subdirectory(incre)
 
set(SRC_LIBS solver_lib  ${SyGuS_LIBS} ext_lib selector_lib basic_lib dsl_lib incre_lib)

add_subdirectory(executor)
