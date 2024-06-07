# project-archiver

Simple project archival tool.

Like many devs I have a bunch of projects in my machine, between finished, unfinished and scrapped ones. That makes my directory folder quite bloated especially for [ThePrimeagen's](https://github.com/ThePrimeagen) [tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer).

# Usage

There are three main ways of using the script.

1. Using only the script without no dependencies.

```shell
project-archiver <PROJECT_ARCHIVE_FOLDER> <PROJECT>

```

2. Using the script with fzf.

```shell
fzf <PROJECTS> | project-archiver  <PROJECT_ARCHIVE_FOLDER>

```

3. Using the script with fzf and tmux.

Inside your `~/.tmux.conf` add the configuration:

```shell
echo 'bind o display-popup -E "bash $HOME/.local/scripts/tmux-sessionizer.sh"' >> ~/.tmux.conf

```
