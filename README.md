# dotfiles
Repository to contain my personal config files for various applications.

Use the following command to bootstrap the initialization, when there is no `~/.bash_profile` yet:
```
git clone git@github.com:LinusVanElswijk/dotfiles.git ~/.dotfiles &&\
cp ~/.dotfiles/bash/templates/profile ~/.bash_profile &&\
source ~/.bash_profile
```

### Bash
Bash configuration files are located in the `bash` subdir.
Check `bash/templates/bash_profile` for the recommended way to incorporate it
into your `~/.bash_profile`.
