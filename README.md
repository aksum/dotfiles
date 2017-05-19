dotfiles
========
[![Run Status](https://api.shippable.com/projects/59138b5f2df7f30700a2cf72/badge?branch=master)](https://app.shippable.com/github/aksum/dotfiles)

Only tested on Debian/Ubuntu!

## Install

- Clone repository into `~/Documents`
- Install and configure everything, run: `ansible-playbook setup-env.yml -c local`
- Install dotfiles only, run: `ansible-playbook setup-env.yml -t vim-dotfiles -c local`

## What

- Install tools
- Install vim plugins
- Install vim theme
- Install powerline fonts
- Create symlinks to the dotfiles in `dotfiles/` in your home directory

## Included
#### tools

Install the following packages:
- vim
- tmux
- ranger
- ncdu
- lnav
- htop

#### vim

- Install [pathogen](https://github.com/tpope/vim-pathogen)
- Install [powerline-fonts](https://github.com/powerline/fonts).
- Install the following plugins:
  - vim-airline
  - ansible-vim
  - badwolf
  - dockerfile
  - molokai
  - nerdtree
  - nerdtree-git-plugin
  - space-vim-dark
  - undotree
  - lexima
  - VimCompletesMe
  - vim-afterglow
  - vim-airline-themes
  - vim-fugitive
  - vim-gitgutter
  - vim-monokai
  - vim-signify

## Tests

Hint! molecule does not destroy instance(s) upon error. run 'molecule destroy' to destroy instance.

- Test playbook: `molecule test`
- Run tests on debian: `molecule test --platform triggi/debian`
- Run tests on ubuntu: `molecule test --platform triggi/ubuntu`

- Troubleshoot: 
  - `molecule create`: creates all instances defined in molecule.yml
  - `molecule converge`: provisions all instances defined in molecule.yml 
  - `molecule idempotence`: provisions instances and parses output to determine idempotence 
  - `molecule verify`: performs verification steps on running instances
  - `molecule login`: initiates an interactive ssh session with the given host

## TODO

- [x] Install tmux
- [x] Install vim
- [x] Install vim plugin manager pathogen
- [x] Install vim airline, instead of powerline
- [x] Install vim theme & plugins
- [ ] Install powerline fonts
- [x] Fix failing pytests!
- [ ] Modify default font in terminal to `Hack Regular 11`

## Author

Pedro Gomes
