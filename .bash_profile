# other
alias flush='sudo killall -HUP mDNSResponder;sudo dscacheutil -flushcache'
alias tokens=$'cat ~/.kube/config | yq \'.users[] as $item ireduce  ({}; .[$item.name | sub(".*@","")] = ($item | .user.auth-provider.config.id-token))\''
alias grep='grep -i --color=auto'
alias python='python3'
export PATH="/Users/alex.ramsay/Library/Python/3.8/bin${PATH:+:${PATH}}"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# kubectl
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@">&2; command kubectl $@; }
