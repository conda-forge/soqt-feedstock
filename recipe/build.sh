# Get an updated config.sub and config.guess
cp $BUILD_PREFIX/share/gnuconfig/config.* ./cfg
mkdir -p build
cd build

cmake ${CMAKE_ARGS} -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D CMAKE_BUILD_TYPE="Release" \
      -D SOQT_USE_QT5=ON \
      -D SOQT_BUILD_DOCUMENTATION:BOOL=NO \
      ..

ninja install
