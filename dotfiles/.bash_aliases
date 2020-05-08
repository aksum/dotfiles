# .bash_aliases: executed by bash(1) for non-login shells.

alias lv='exa -bghHlS --git'
alias ll='ls -alF'
alias vi='vim'
alias rgr='ranger'
# calculator
alias bc='bc -l'
alias diff='diff --color=always'
alias ping='ping -c 5'
alias ports='netstat -tulanp'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
# for humans
alias meminfo='free -h -l -t'
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# get top process eating cpu
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
# get server cpu info
alias cpuinfo='lscpu'
# git
alias gb='git branch'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin'
alias gl='tig'
# argument = service name
gclone() {
  if ! [[ -z "$1"  ]]
  then
    git clone git@github.com:"${2:-olisto}"/"$1"
  else
    echo "Error! Missing argument repository name"
  fi
}
