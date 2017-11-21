# My dotfiles
zsh, vim and byobu config files.

To install:

```bash
cd $HOME
git clone https://github.com/pierrrrrrre/dotfiles.git
ln -sf dotfiles/zshrc .zshrc
ln -sf dotfiles/vimrc .vimrc
ln -sf dotfiles/gitconfig .gitconfig
ln -sf ~/dotfiles/tmux.conf ~/.byobu/.tmux.conf
```

You can add personal stuff in a `~/.zshrc-$USER` file, it will be sourced when
`.zshrc` is.

To update:

```bash
cd $HOME/dotfiles
git pull
```
