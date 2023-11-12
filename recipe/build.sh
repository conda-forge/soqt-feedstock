#!/bin/bash

# Create the build directory
mkdir -p build
cd build

# Set QT_SELECTOR based on the build variant
QT_SELECTOR=""
if [[ "$build_variant" = "qt5" ]]; then
    QT_SELECTOR="-D SOQT_USE_QT5=ON"
elif [[ "$build_variant" = "qt6" ]]; then
    QT_SELECTOR="-D SOQT_USE_QT6=ON"
fi

# Ensure the build uses the correct Qt tools
if [[ ${target_platform} =~ osx-arm64 ]]; then
    rm -f "${PREFIX}/lib/qt6/moc"
    ln -s "${BUILD_PREFIX}/lib/qt6/moc" "${PREFIX}/lib/qt6/moc"
fi

# Run CMake with specified options
cmake -G "Ninja" \
    -D CMAKE_INSTALL_PREFIX="$PREFIX" \
    -D CMAKE_PREFIX_PATH="$PREFIX" \
    -D CMAKE_BUILD_TYPE="Release" \
    -D SOQT_BUILD_DOCUMENTATION:BOOL=NO \
    -D QT_HOST_PATH="${PREFIX}" \
    ${QT_SELECTOR} \
    ..

# Build and install using Ninja
ninja install
