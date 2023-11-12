mkdir -p build
cd build

QT_SELECTOR=()

if [[ "$build_variant" = "qt5" ]]; then
      QT_SELECTOR+=("-D SOQT_USE_QT5=ON")
fi
if [[ "$build_variant" = "qt6" ]]; then
      QT_SELECTOR+=("-D SOQT_USE_QT6=ON")
fi

# preventing the build from using the wrong build of qt.
# Qt tools for the build should be used from the BUILD_PREFIX
if [[ ${target_platform} != ${build_platform} ]]; then
      rm -f ${PREFIX}/lib/qt6/moc
      ln -s ${BUILD_PREFIX}/lib/qt6/moc ${PREFIX}/lib/qt6/moc
fi

cmake -G "Ninja" \
      -D CMAKE_INSTALL_PREFIX=$PREFIX \
      -D CMAKE_PREFIX_PATH=$PREFIX \
      -D CMAKE_BUILD_TYPE="Release" \
      -D SOQT_BUILD_DOCUMENTATION:BOOL=NO \
      -D QT_HOST_PATH=${PREFIX} \
      "${QT_SELECTOR[@]}" \
      ..

ninja install
