https://github.com/spf13/spf13-vim

#vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#ctags#######################################################
wget http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz
tar xzvf ctags-5.8.tar.gz
cd ctags-5.8
./configure
make
sudo make install
ctags -R  --file-scope=yes  --languages=c,c++ --links=yes --c-kinds=+px --fields=+iaS --extra=+q -f ~/.vim/systags /usr/include /usr/local/include
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q
#---vimrc 
　map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
 set tags=tags;set tags+=~/.vim/systags

#Taglist#######################################################
git clone https://github.com/vim-scripts/taglist.vim.git  taglist
cp ~/.vim/downloads/taglist/plugin/* ~/.vim/plugin/
cp ~/.vim/downloads/taglist/doc/* ~/.vim/doc/
#---vimrc 
#Cscope#######################################################
wget http://cscope.sourceforge.net/cscope_maps.vim

#OmniCppComplete#######################################################
git clone https://github.com/vim-scripts/OmniCppComplete.git

#Supertab
git clone https://github.com/ervandew/supertab.git

#nerdtree
git clone https://github.com/scrooloose/nerdtree.git

# 
https://www.vim.org/scripts/script.php?script_id=159
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
  
#winmanager  
https://www.vim.org/scripts/script.php?script_id=95
