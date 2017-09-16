
set -e  # exit immediately on error
set -x  # display all commands

ROOT_DIR=`pwd`

cd third_party/leveldb

make

mkdir lib;cd lib;ln -s ../libleveldb.a libleveldb.a

cd $ROOT_DIR/third_party/protobuf

./autogen.sh

./configure CXXFLAGS=-fPIC --prefix=`pwd`

make && make install

cd $ROOT_DIR

./autoinstall.sh

make && make install

cd third_party/glog

./configure CXXFLAGS=-fPIC --prefix=`pwd`

make && make install

cd $ROOT_DIR/plugin

make && make install

cd $ROOT_DIR/sample/phxecho; make; mkdir -p log

cd $ROOT_DIR/sample/phxelection; make; mkdir -p log

cd $ROOT_DIR

echo "Install Phxpaxos Successfull"
