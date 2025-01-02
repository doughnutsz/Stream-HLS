cd extern/barnivok
./get_submodules.sh
sh autogen.sh
mkdir build
./configure --prefix=$(pwd)/build --with-pet=bundled --with-clang=system --with-isl=bundled --enable-shared-barnivok
