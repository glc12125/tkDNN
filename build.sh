if [ ! -d build ];then
        mkdir build
fi

WORKING_SPACE="$HOME/Development"
echo "WORKING_SPACE: ${WORKING_SPACE}"

cd build


if [ "$1" = "d" ]; then
  echo "Debug mode is on"
  cmake -DDEBUG=ON -DWORKING_SPACE=${WORKING_SPACE} ..
else
  cmake -DWORKING_SPACE=${WORKING_SPACE} -DCMAKE_BUILD_TYPE=Release ..
fi

getCoreNumCmd="getconf _NPROCESSORS_ONLN"
echo "Number of cores: `eval ${getCoreNumCmd}`"
#make -j${coreNum}
make

