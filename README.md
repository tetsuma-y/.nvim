# .nvim

### nvim (ubuntu 20.04 LTS)
```
sudo apt install software-properties-common
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
sudo apt install ctags clang global
```

### 導入  
1. home 以下で `git clone https://github.com/tetsuma-y/.nvim/`
2. deinを入れる. `~/.nvim/` 以下で、 `git clone https://github.com/Shougo/dein.vim`
3. .bashrc に `export XDG_CONFIG_HOME="$HOME/.nvim"` を追記
4. nvim上で`:call dein#install()`
5. vimproc が自動でbuildされないときは自分でbuild `~/.vim/dein/repos/github.com/Shougo/vimproc.vim$ make`
6. `sudo apt install xsel` clipboard yank に必要
7. `sudo apt install python3-pip`, `pip3 install neovim` deoplete.nvim に必要。  
   `:UpdateRemotePlugins` がvim上で必要かも。
8. mustではないけど、.bashrc に`alias vim='nvim'`追加でvimとして扱う

### 各 package の目的
- global: gtags
- clang: C/C++ の構文解析
- ctags: unite-outline

### WSL での clipboard共有
- WSL で clipboard yank するためには、https://github.com/equalsraf/win32yank/releases のexeを  
  WSL PATH の通ったところに置く。

### 将来
- uniteの開発が停止したため、deniteに乗り換えたい(filerとかがShougo氏の物がでれば乗り換える)

### 直接関係ないが、共用環境でlocalにnvimをinstall
```
rm -r build/
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/bin/neovim"
make install
export PATH="$HOME/bin/neovim/bin:$PATH"
```
### gitの設定でnvimをmergetoolとかdifftoolで使う

https://gist.github.com/huytd/78c676a797f81eb08cdedf5400e1b6a3
