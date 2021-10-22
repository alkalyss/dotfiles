# dotfiles

To install these dotfiles you shall execute the following steps:

```bash
git clone --bare git@gitlab.com:alk-alyss/dotfiles $HOME/.files

alias dots='/usr/bin/git --git-dir=$HOME/.files/ --work-tree=$HOME'

dots checkout
```

If any errors occur, that means that you have conflicting dotfiles. Back them up and do dots checkout again.
