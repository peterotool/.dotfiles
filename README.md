# README

Based on the following repos:

- [SylvanFranklin](https://github.com/SylvanFranklin/.config/)
- [protiumx](https://github.com/protiumx/.dotfiles)
- [andrew8088](https://github.com/andrew8088/dotfiles)
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles)
- [agilesteel](https://github.com/agilesteel/.dotfiles)
- [omerxx](https://github.com/omerxx/dotfiles)

- agregar eliminar archivos de conf home
- testiar submodules

## Installing

```sh
git clone --recurse-submodules git@github.com:peterotool/.dotfiles.git
./install.sh
```

or

```sh
git clone git@github.com:peterotool/.dotfiles.git
git submodule update --init --recursive
./install.sh
```

or

```sh
git clone git@github.com:peterotool/.dotfiles.git
./add_git_submodules.sh
./install.sh
```

Why this works?

```git
[submodule "config/nvim"]
 path = config/nvim
 url = git@github.com:peterotool/nvim.git

 [submodule "config/alacritty/catppuccin"]
 path = config/alacritty/catppuccin
 url = https://github.com/catppuccin/alacritty.git
```

```sh
#!/bin/sh

set -e

# Get All Submodule Paths
git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
# Loop Through Each Submodule
while read path_key local_path
do
# Construct URL Key for Submodule
url_key=$(echo $path_key | sed 's/\.path/.url/')
# Retrieve the Submodule's URL
url=$(git config -f .gitmodules --get "$url_key")
# Add the Submodule
git submodule add $url $local_path
done
```

```sh
git submodule add $url 
```

Why this doesn´t work?

```sh
git submodule init
git submodule update --recursive --remote
git submodule foreach --recursive git pull origin master
```

explain the difference between:
git ls-files --stage # Inspect the Git index (a.k.a. staging area).
git rm -f # removes the file from the index (so Git no longer tracks it), and also deletes the file from your working directory.
