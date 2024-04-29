ansible-role_vim
================

Overview
--------

This ansible ansible role installs vi (neovim) and many usefull plugins (especially for puppet development) and also generates a valid init.vim configuration file.

## Vim Shortcuts for plugins

<ctrl> T: CommanderT (fuzzysearch)
<ctrl> N: Nerdtree
j / k: comfortable motion

## Use this role standalone (not included as role in an existing playbook)

```
# ansible-playbook -i 'localhost,' --connection=local -K standalone.yml
```
