@echo on
cmake -G "Ninja" -D "QT_HOST_PATH=%PREFIX%" .
if errorlevel 1 exit 1
