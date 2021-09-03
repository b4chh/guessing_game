DIR="build"
if [ -d "$DIR" ]; then
  rm -r $DIR
  echo "RM  ${DIR}..."
fi
mkdir build && cd build
cmake ..
make run