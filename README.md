ansible-role_vim
================

Overview
--------

This ansible role installs vi (neovim) and many usefull plugins (especially for puppet development) and also generates a valid init.vim configuration file.

## Overview

### Auto installed Language Server

- Puppet
- NGINX
- Python
- docker
- docker-compose
- bash
- vim
- ansible

### Auto installed Linter

- puppet
- yaml
- ruby
- shellcheck (Bash)

### PlugIns

- automkdir.nvim (Automatically creates non-existent parent directories when writing a file)
- command-t (provides an extremely fast "fuzzy" mechanism)
- coq (auto complition)
- editorconfig-vim (Editor config)
- indentLine (displaying thin vertical lines at each indentation level)
- nerdtree (a tree Explorer)
- nvim-devicons (icons / nerdfont)
- nvim-lint (neo vim lua lint)
- onedark (color theme)
- rubocop (ruby)
- startify (provides a start screen)
- tabular (text filtering and alignment)
- trouble.nvim (A pretty diagnostics, references, telescope results, quickfix and location list)
- vim-gitgutter (shows a git diff in the sign column)
- vim-plug (Plugin Manager)
- vim-puppet (make vim puppet friendly)
- vim-ruby (ruby)
- vim-shellcheck (wrapper for shellcheck)
- vim-todo-lists (TODO lists management)

## Vim Shortcuts for plugins

<ctrl> T: CommanderT (fuzzysearch)
<ctrl> N: Nerdtree
j / k: comfortable motion

## Use this role standalone (not included as role in an existing playbook)

```
# ansible-playbook -i 'localhost,' --connection=local -K standalone.yml
```
### To update Plugins:
```
# ansible-playbook -i 'localhost,' --connection=local -K standalone.yml -e update=true
```
