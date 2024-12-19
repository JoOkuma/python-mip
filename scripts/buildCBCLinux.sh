export CFLAGS="-Ofast -fPIC -flto -DNDEBUG -fprefetch-loop-arrays -I/opt/gcc/include/"
export FFLAGS="-Ofast -fPIC -flto -DNDEBUG -I/opt/gcc/include/"
export CXXFLAGS="-Ofast -fPIC -flto -fprefetch-loop-arrays -DNDEBUG -I/opt/gcc/include/"
export LDFLAGS="-Ofast -fPIC -L/opt/gcc/lib -flto -static-libgcc -static-libstdc++ -static-libgfortran"
export LD_LIBRARY_PATH="$CONDA_PREFIX/lib:$LD_LIBRARY_PATH"

"${CXX:=g++}"

dir=`pwd`
mkdir -p ~/prog
cd ~/prog
IDIR=`pwd`
export PKG_CONFIG_PATH=${IDIR}/lib/pkgconfig/:${PKG_CONFIG_PATH}

#cd $dir/ThirdParty-Metis
#./configure --prefix=$IDIR --enable-static --disable-shared
#make -j 6
#make -j 6 install

cd $dir/ThirdParty-Blas
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install

cd $dir/ThirdParty-Lapack
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install

#cd $dir/ThirdParty-Mumps
#./configure --prefix=$IDIR --enable-static --disable-shared
#make -j 6
#make -j 6 install

cd $dir/ThirdParty-Glpk
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install


cd $dir/CoinUtils
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install

cd $dir/Osi
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install

cd $dir/Clp
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install

cd $dir/Cgl
./configure --prefix=$IDIR --enable-static --disable-shared
make -j 6
make -j 6 install


cd $dir/Cbc
./configure --prefix=$IDIR --enable-static --disable-shared --with-readline=$CONDA_PREFIX
make -j 6
make -j 6 install

cd $dir

patch -u ${IDIR}/include/coin-or/CoinMpsIO.hpp -i coinutils-glpk.patch

$CXX -shared -Ofast -fPIC -o ../mip/libraries/cbc-c-linux-x86-64.so \
 -I${IDIR}/include/coin-or/ \
 -DCBC_THREAD \
 ./Cbc/src/Cbc_C_Interface.cpp \
 -L/opt/gcc/lib64/ -L${IDIR}/lib/ \
 -lCbc -lCgl -lClp -lCoinUtils -lOsi -lOsiCbc -lOsiClp -lOsiGlpk \
 -lcoinblas -lcoinglpk -lcoinlapack \
 -lreadline -lbz2 -lz \
 -lcoinlapack -lcoinblas -lgfortran -lquadmath -lm -static-libgcc -static-libstdc++ -static-libgfortran -lcoinglpk
