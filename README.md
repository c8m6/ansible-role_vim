ansible-role_vim
================

This ansible role installs vi (neovim) and many usefull plugins (especially for puppet development) and also generates a valid init.vim configuration file.

## Overview

![image](https://github.com/c8m6/ansible-role_vim/assets/35730763/73aead48-2996-401b-bd29-9b0d76074b94)

Use <CTRL> + t to open fuzzy search window.

----------

![image](https://github.com/c8m6/ansible-role_vim/assets/35730763/1ff4bc6e-7768-4f44-a0b3-ac0fd699bb26)

Retrieve messages from language servers and/or snippets for the current language while tipping.

----------

![image](https://github.com/c8m6/ansible-role_vim/assets/35730763/7acdbc3e-2287-4111-9377-ed38c8604c85)

Have a look to your mistakes ;-)

----------

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
- cmp (auto complition)
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
Type into nvim
```
:PlugUpdate
```
## Run in Docker container
try [Docker/nvim](Docker/nvim) and use [Image](https://hub.docker.com/r/c8m6/nvim) created by [Dockerfile](Dockerfile)

```bash
#!/bin/bash

# SET NVIM_PROJECT_DIR as environment variable to mount your project dir, independent from you current dir

PREFIX=/NVIM

# Set all mount points
MOUNTDIRS+=("$NVIM_PROJECT_DIR")
MOUNTDIRS+=("$(git rev-parse --show-toplevel 2> /dev/null)")
MOUNTDIRS+=("$PWD")

for arg in "$@" ; do
  realpath=$(realpath "$arg")
  dir=$(dirname "$realpath")
  if [ -d "$dir" ] ; then
    MOUNTDIRS+=("$dir")
    PARAMS+=("${PREFIX}${realpath}")
  else
    PARAMS+=("$arg")
  fi
done

for i in "${!MOUNTDIRS[@]}"; do [[ -z ${MOUNTDIRS[i]} ]] && unset 'MOUNTDIRS[i]'; done

for mount in "${MOUNTDIRS[@]}" ; do
  skip=false
  for test in "${MOUNTDIRS[@]}" ; do
    if [[ "$mount" != "$test" && "$mount" == "${test}/"* ]] ; then
      skip=true
      break
    fi
  done
  if ! $skip ; then
    MOUNTS+=("--volume=${mount}:${PREFIX}${mount}")
  fi
done

# create volume for nvim if not exists
volume="nvim-home-$(id -un)"
docker volume inspect "${volume}" > /dev/null 2>&1 || docker volume create "${volume}" > /dev/null

# run container
docker run --rm -ti --name "nvim-${$}" \
  -v "${volume}:/home/nvim" \
  "${MOUNTS[@]}" \
  -w "${PREFIX}${PWD}" \
  --user "$(id -u):$(id -g)" \
  c8m6/nvim:latest \
  -c "cd ${PREFIX}${PWD}" "${PARAMS[@]}"
```

