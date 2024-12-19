
COIN_UTILS_HASH=16782006a2b5b1473ce38907f2adb8fa13384761
OSI_HASH=e5cd07c7e046924dc35b57ee46a2cf887d1bc8cb
CLP_HASH=5b8c99e8df0d2ebf8609b8f22ca5bc675361c801
CGL_HASH=a62c67fa242a4db4ba390b9aa5fb55c874a2a33c
CBC_HASH=1c3eabc441d33dc039c9570bebb5d86b141c449a
GLPK_HASH=87037f5f23f8ca11afaf10d64622f8a117ea8663
LAPACK_HASH=e6436dcf841a885e4e99c9bb97596bda2f199fdd
BLAS_HASH=258a84b9059942a9c597a929f061043f3c2d7f65

echo "Checking CoinUtils"
if [[ ! -d CoinUtils ]]
then
    git clone https://github.com/coin-or/CoinUtils
fi
cd CoinUtils
git checkout $COIN_UTILS_HASH
cd ..


echo "Checking Osi"
if [[ ! -d Osi ]] 
then
    git clone https://github.com/coin-or/Osi
fi
cd Osi
git checkout $OSI_HASH
cd ..


echo "Checking Clp"
if [[ ! -d Clp ]]
then
    git clone https://github.com/coin-or/Clp
fi
cd Clp
git checkout $CLP_HASH
cd ..


echo "Checking Cgl"
if [[ ! -d Cgl ]]
then
    git clone https://github.com/coin-or/Cgl
fi
cd Cgl
git checkout $CGL_HASH
cd ..


echo "Checking Cbc"
if [[ ! -d Cbc ]]
then
    git clone https://github.com/coin-or/Cbc
fi
cd Cbc
git checkout $CBC_HASH
cd ..

echo "Checking Glpk"
if [[ ! -d ThirdParty-Glpk ]]
then
    git clone https://github.com/coin-or-tools/ThirdParty-Glpk.git
fi
cd ThirdParty-Glpk
git checkout $GLPK_HASH
./get.Glpk
cd ..


echo "Checking Lapack"
if [[ ! -d ThirdParty-Lapack ]]
then
    git clone https://github.com/coin-or-tools/ThirdParty-Lapack.git
fi
cd ThirdParty-Lapack
git checkout $LAPACK_HASH
./get.Lapack
cd ..


echo "Checking Blas"
if [[ ! -d ThirdParty-Blas ]]
then
    git clone https://github.com/coin-or-tools/ThirdParty-Blas.git
fi
cd ThirdParty-Blas
git checkout $BLAS_HASH
./get.Blas
cd ..
