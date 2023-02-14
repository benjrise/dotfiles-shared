alias nv="nvidia-smi"

# ========== bashrc  ==========
alias bash_aliases="vim ~/.bash_aliases && source ~/.bashrc"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
# begin (useful in singularity shells loads bash_profile can't get to work properly using --rcfile)
alias b=". {HOME}/.bash_profile"

# ========== Bash navigation  ==========
alias ..="cd .."
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias la='ls -a --color=auto'
alias ll='ls -la --color=auto'
alias mkdir='mkdir -pv'

# ========== Tar aliases  ==========
alias untar='tar -zxvf'
alias tarz='tar -czvf'

# ======== git aliases =========
alias gs='git status'
alias ga='git add'
alias gau='git add -u'
alias gc='git commit -m'
alias gp='git push'
gcp () {
    git checkout $1
    git stash pop
}
