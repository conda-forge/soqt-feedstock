mkdir build
cd build

set "QT_SELECTOR="

if "%build_variant%"=="qt5" (
    set "QT_SELECTOR=-D SOQT_USE_QT5=ON"
    echo QT_SELECTOR set for qt5: %QT_SELECTOR%
)

if "%build_variant%"=="qt6" (
    set "QT_SELECTOR=-D SOQT_USE_QT6=ON"
    echo QT_SELECTOR set for qt6: %QT_SELECTOR%
)

if "%QT_SELECTOR%"=="" (
    echo Unknown build variant: %build_variant%. QT_SELECTOR remains unset.
)

cmake -G "Ninja" ^
      -D CMAKE_PREFIX_PATH:FILEPATH="%PREFIX%" ^
      -D CMAKE_INSTALL_PREFIX:FILEPATH="%LIBRARY_PREFIX%" ^
      -D CMAKE_BUILD_TYPE="Release" ^
      -D SOQT_BUILD_DOCUMENTATION:BOOL=NO ^
      %QT_SELECTOR% ^
      ..

if errorlevel 1 exit 1
ninja install
if errorlevel 1 exit 1
