# oasis

```
cd ~
git init
git remote add origin https://github.com/metheglin/oasis.git
git fetch
git checkout -f -t origin/master

git remote rm origin
git remote add origin git@github.com:metheglin/oasis.git
```

# zsh

```
chsh -s /bin/zsh
```

# sudo

```
gpasswd -a metheglin wheel
```

# NeoBundle

```
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim test
  # :NeoBundleInstall
```
