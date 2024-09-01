alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias download='curl -LOC -'
alias gti='git'

if [ -e /home/abid/.nix-profile/etc/profile.d/nix.sh ]; then . /home/abid/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e "$HOME/.cargo/env" ]; then . "$HOME/.cargo/env"; fi
