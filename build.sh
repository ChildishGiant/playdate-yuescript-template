#!/usr/bin/env sh

# Wipe compiled lua
find ./source/ -type f -name "*.lua" -exec rm {} +
# Compile yue to lua
yue ./source/yue -t ./source/
# Replace requires with imports
find source/ -type f -name "*.lua" -exec sed -i 's/require/import/g' {} +
# Compile pdx
pdc --skip-unknown --quiet ./source build  # Don't copy source files to build
