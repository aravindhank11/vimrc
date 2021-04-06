# VIM
Setting up a pretty vim

NOTE: The below commands were tested on Ubuntu VM which was used via SSH from MAC

### Setting up a pretty iTerm2
* Follow https://mayccoll.github.io/Gogh/ and install "Argonaut" theme

### Install plug.vim which will help in installing other packages
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Softlink the vimrc file to the box:
```
ln -sf <cloned_dir>/.vimrc ~/.vimrc
```

### Open vim and run the following commands to install the plugins
```
vim ~/.vimrc
<Esc>:source ~/.vimrc
<Esc>:PlugInstall
<Esc>:q
<Esc>:wq
```
