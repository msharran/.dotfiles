# .dotfiles

### Installation

To create symlinks for the dotfiles in this repo
to your home directory without using install.rb,
Install all the dependencies mentioned in the Installfile
manually

1. Clone the repo into your home directory.

> I am using Github CLI, you can use any means like http or ssh

```bash
gh repo clone msharran/.dotfiles
```

2. Install all the dotfiles using make

```bash
cd .dotfiles
make
```

## Verification

Your home should finally look like this

```bash
$ ls -la ~ | grep .dotfile
lrwxr-xr-x    1 sharranm  staff        17 Sep 11 03:46 .config -> .dotfiles/.config
drwxr-xr-x    9 sharranm  staff       288 Sep 11 03:46 .dotfiles
lrwxr-xr-x    1 sharranm  staff        16 Sep 11 03:46 .zshrc -> .dotfiles/.zshrc
```

## Keep your dotfiles in sync

When you make changes to your dotfiles, they get reflected to home dir
as they are symlinks.

But when you add new files, you need to create symlinks for those by 
running the following command again

```bash
make
```

## Cleanup

When you are changing your laptop for some reason or
If you want to clean up all symlinks, run

```bash
make clean
```
