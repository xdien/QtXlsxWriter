cmake_minimum_required(VERSION 3.16)
project(QtXlsx VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# Support both Qt5 and Qt6
find_package(QT NAMES Qt6 Qt5 REQUIRED COMPONENTS Core)
find_package(Qt${QT_VERSION_MAJOR} REQUIRED COMPONENTS Core Gui)

file(GLOB XLSX_SOURCES src/xlsx/*.cpp)
file(GLOB XLSX_HEADERS src/xlsx/*.h)

add_library(QtXlsx SHARED ${XLSX_SOURCES})
target_sources(QtXlsx PRIVATE ${XLSX_HEADERS})

target_compile_definitions(QtXlsx PRIVATE QT_BUILD_XLSX_LIB)

target_include_directories(QtXlsx
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src/xlsx>
        $<INSTALL_INTERFACE:include/QtXlsx>
)

target_link_libraries(QtXlsx PUBLIC
    Qt${QT_VERSION_MAJOR}::Core
    Qt${QT_VERSION_MAJOR}::Gui
)

# Export CMake configuration for find_package(QtXlsx)
include(GNUInstallDirs)

install(TARGETS QtXlsx
    EXPORT QtXlsxTargets
    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

install(FILES ${XLSX_HEADERS}
    DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/QtXlsx
)

install(EXPORT QtXlsxTargets
    FILE QtXlsxTargets.cmake
    NAMESPACE QtXlsx::
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/QtXlsx
)

# Generate QtXlsxConfig.cmake
include(CMakePackageConfigHelpers)
configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/QtXlsxConfig.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/QtXlsxConfig.cmake
    INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/QtXlsx
)

write_basic_package_version_file(
    ${CMAKE_CURRENT_BINARY_DIR}/QtXlsxConfigVersion.cmake
    VERSION ${PROJECT_VERSION}
    COMPATIBILITY AnyNewerVersion
)

install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/QtXlsxConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/QtXlsxConfigVersion.cmake
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/QtXlsx
)
