#!/usr/bin/env sh

# Wipe compiled lua
rm ./source/*.lua -f # -f to surpress output
# Compile yue to lua
yue ./source/yue -t ./source/
# Add imports
echo 'import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"' > tmpfile && cat source/main.lua >> tmpfile && mv tmpfile source/main.lua
# Replace requires with imports
find source/*.lua -exec sed -i 's/require/import/g' {} +
# Compile pdx
pdc --skip-unknown --quiet ./source build  # Don't copy source files to build
