mkdir -p build
cd build

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D CMAKE_INSTALL_LIBDIR=$PREFIX/lib \
      -D CMAKE_BUILD_TYPE="Release" \
      -D SOQT_USE_QT5=ON \
      -D CMAKE_C_FLAGS_RELEASE=${CFLAGS} \
      -D CMAKE_C_FLAGS_DEBUG=${CFLAGS} \
      -D SOQT_BUILD_DOCUMENTATION:BOOL=NO \
      ..

ninja install
