ansible-role_vim
================

This ansible role installs vi (neovim) and many usefull plugins (especially for puppet development) and also generates a valid init.vim configuration file.

## Overview

<<<<<<< HEAD
=======
![image](https://github.com/c8m6/ansible-role_vim/assets/35730763/73aead48-2996-401b-bd29-9b0d76074b94)

Use <CTRL> + t to open fuzzy search window.

----------

![image](https://github.com/c8m6/ansible-role_vim/assets/35730763/1ff4bc6e-7768-4f44-a0b3-ac0fd699bb26)

Retrieve messages from language servers and/or snippets for the current language while tipping.

----------

![image](https://github.com/c8m6/ansible-role_vim/assets/35730763/7acdbc3e-2287-4111-9377-ed38c8604c85)

Have a look to your mistakes ;-)

----------

>>>>>>> dev
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

```
<ctrl> T: CommanderT (fuzzysearch)
<ctrl> N: Nerdtree
j / k: comfortable motion
```

## Installation 

### Use this role standalone 

```
# ansible-playbook -i 'localhost,' --connection=local -K standalone.yml
```
### To update Plugins:

```
# ansible-playbook -i 'localhost,' --connection=local -K standalone.yml -e update=true
```
