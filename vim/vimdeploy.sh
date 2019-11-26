 
#  ctags 
cd ~/.vim/
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar -xzvf ctags-5.8.tar.gz
cd ctags-5.8/
./configure
make
sudo make install

