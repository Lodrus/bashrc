# kubectl
if ! [ -f ~/.kubectl_aliases ]; then
    curl -Ls --insecure -o ~/.kubectl_aliases https://raw.githubusercontent.com/ahmetb/kubectl-aliases/master/.kubectl_aliases
fi
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases

alias kcuc='kubectl config use-context'

# vim
if ! [ -f ~/.vimrc ]; then
    curl -Ls --insecure -o ~/.vimrc https://raw.githubusercontent.com/amix/vimrc/master/vimrcs/basic.vim
fi

# other
alias grep='grep --color=auto'
