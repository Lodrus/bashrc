## k8s
```sh
# Get auth tokens from .kube config
cat ~/.kube/config | yq '.users[] as $item ireduce  ({}; .[$item.name | sub(".*@","")] = ($item | .user.auth-provider.config.id-token))'

# Get all endpoint IPs
kubectl get endpoints -o custom-columns='NAMESPACE:.metadata.namespace,NAME:.metadata.name,IP:.subsets[*].addresses[*].ip'
```

## Git
```sh
# List all commits between two git refs, filtered by author. Results are ready for chery-pick-ing
git log HEAD..nonprod/master --pretty=format:"%H" --no-merges --author=".*(amsay|uncan|lena|abich|ansom).*" --perl-regexp --reverse | xargs echo | xargs git cherry-pick
git log HEAD..862bd48ff1378d7c72c95c12707344d4e8a80bab --pretty=format:"%H" --reverse --cherry -- common/pbs* | git cherry-pick --strategy=ours --stdin

# Cleanup local branches
git fetch --prune; git branch --format "%(refname:short) %(upstream)" | awk '{if (!$2) print $1;}' | xargs git branch -D
```

## Linux
```sh
# Get unallocated disk space
sudo vgs

# extend a volume by 1 GB
sudo lvextend -r --size +1g /dev/mapper/rootvg-lv.local

# get kernel version
uname -r

# get current patch levels
grep pulp /etc/yum.repos.d/*

# get log files for pid
lsof -p 2824 | grep -i log
```

## Macos
```sh
ps -ef | grep [w]ebex | awk '{print $2}'  | xargs kill -9
sudo killall -HUP mDNSResponder;sudo dscacheutil -flushcache
sudo killall mDNSResponderHelper

# enable touch id
grep pam_tid /etc/pam.d/sudo >/dev/null || echo auth sufficient pam_tid.so | cat - /etc/pam.d/sudo | sudo tee /etc/pam.d/sudo > /dev/null
```