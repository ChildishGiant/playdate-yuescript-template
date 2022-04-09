yue ./source/yue -t ./source/
echo "Yue compiled"
# Add imports
echo 'import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"' > tmpfile && cat source/main.lua >> tmpfile && mv tmpfile source/main.lua
# Replace requires with imports
find source/*.lua -exec sed -i 's/require/import/g' {} +
echo "Imports added"
# Compile pdx
pdc ./source build
