ansible-role_vim
================

Overview
--------

This ansible ansible 2.4 role installs vim and many usefull plugins and also generates a valid .vimrc

## Loaded Plugins
```
      syntastic
      tabular
      vim-addon-manager-knwon-repositories
      vim-airline
      vim-airline-themes
      vim-fugitive
      vim-puppet
      onedark
      nerdtree
      vim-surround
      vim-gitgutter
      YouCompleteMe
      ultisnips
      vim-snippets
      vim-bufferline
      vim-eunuch
      vim-todo-list
      indentLine
      vim-janitor
      comfortable-motion
      command-t
```
## Vim Shortcuts

<ctrl> T: CommanderT (fuzzysearch)
<ctrl> N: Nerdtree
j / k: comfortable motion

## Use this role standalone (not included as role in an existing playbook)

```
# ansible-playbook -i 'localhost,' --connection=local -K standalone.yml
```
