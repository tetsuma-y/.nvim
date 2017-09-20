# .nvim

### 導入  
1. home 以下で `git clone https://github.com/tetsuma-y/.nvim/`
2. .bashrc に `export XDG_CONFIG_HOME="$HOME/.nvim"` を追記
3. nvim上で`:call dein#install()`
4. mustではないけど、.bashrc に`alias vim='nvim'`追加でvimとして扱う

### ハマリポイント
- global は 6.4以降でないと動かない(ubuntu 16.04 LTS では default 5.7なので動かず)
- clang も必要 C/C++ の構文解析に
- python3は必要（deniteを入れてないので厳密に今はいらないかも)

### 将来
- uniteの開発が停止したため、deniteに乗り換えたい(filerとかがShougo氏の物がでれば乗り換える)
