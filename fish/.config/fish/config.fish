if status is-interactive
    # Commands to run in interactive sessions can go here
		set -g PATH $PATH $HOME/.nix-profile/bin $HOME/Applications/bin
		set -g EDITOR "nvim"
		set -g SUDO_EDITOR "nvim"
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
