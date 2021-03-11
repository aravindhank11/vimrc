# VIM
Setting up a pretty vim

### Install plug.vim which will help in installing other packages
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Copy the vimrc file to the box:
```
cp vimrc ~/.vimrc
```

### Open vim and run the following commands to install the plugins
```
vim ~/.vimrc
<Esc>:source ~/.vimrc
<Esc>:PlugInstall
<Esc>:q
<Esc>:wq
```
