# README

Based on the following repos:

- [SylvanFranklin](https://github.com/SylvanFranklin/.config/)
- [protiumx](https://github.com/protiumx/.dotfiles)
- [andrew8088](https://github.com/andrew8088/dotfiles)
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles)
- [agilesteel](https://github.com/agilesteel/.dotfiles)
- [omerxx](https://github.com/omerxx/dotfiles)

## Installing

```sh
curl -sO https://raw.githubusercontent.com/peterotool/.dotfiles/main/dotfiles
```

## Main Scripts

- scripts/config.sh: general settings and dotfiles
- scripts/osx.sh: MacOS settings

## Testing Stow

```sh
stow -nSv vim
```

## Adding Git Submodules

To add Git submodules, run the following commands:

```sh
git submodule init
git submodule update --recursive --remote
git submodule foreach --recursive git pull origin master
```
