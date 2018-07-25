# .nvim

### nvim (ubuntu)
```
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

### 導入  
1. home 以下で `git clone https://github.com/tetsuma-y/.nvim/`
2. deinを入れる. `~/.nvim/` 以下で、 `git clone https://github.com/Shougo/dein.vim`
3. .bashrc に `export XDG_CONFIG_HOME="$HOME/.nvim"` を追記
4. nvim上で`:call dein#install()`
5. mustではないけど、.bashrc に`alias vim='nvim'`追加でvimとして扱う

### ハマリポイント
- global は 6.4以降でないと動かない(ubuntu 16.04 LTS では default 5.7なので動かず)
- clang も必要 C/C++ の構文解析に
- ctags も必要 unite-outline に (ubuntuでは sudo apt install exuberant-ctags)
- python3は必要（deniteを入れてないので厳密に今はいらないかも)

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
