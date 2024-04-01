export CC=clang
export CXX=clang++
export CFLAGS="-O0 -g"
export CXXFLAGS="-O0 -g"

V="V=1 VERBOSE=1"
PARALLEL="-j $(nproc)"

cd build
make clean
PKG_CONFIG_PATH=/home/ivan/development/linux_pv/sr/lib/pkgconfig ../configure --disable-python --disable-ruby --disable-java --prefix=/home/ivan/development/linux_pv/sr
make $PARALLEL $V
sudo PYTHONPATH=/home/ivan/development/linux_pv/sr/lib/python3.10/site-packages make install $V
make check $V
