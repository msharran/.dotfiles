# .dotfiles

## Usage

To create symlinks for the dotfiles in this repo
to your home directory

1. Clone the repo into your home directory.

2. Run setup

```bash
cd .dotfiles
make
```

3. Your home should finally look like this

```bash
$ ls -la ~ | grep .dotfile
lrwxr-xr-x    1 sharranm  staff        17 Sep 11 03:46 .config -> .dotfiles/.config
drwxr-xr-x    9 sharranm  staff       288 Sep 11 03:46 .dotfiles
lrwxr-xr-x    1 sharranm  staff        16 Sep 11 03:46 .zshrc -> .dotfiles/.zshrc
```

---

If you want to clean up all symlinks, run

```bash
make clean
```
