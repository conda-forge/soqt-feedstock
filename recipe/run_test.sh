#!/bin/bash
set -ex
cmake -G "Ninja" -D "QT_HOST_PATH=${PREFIX}" .
