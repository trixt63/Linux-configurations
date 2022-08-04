if status is-interactive
    # Commands to run in interactive sessions can go here
end

# turn-off greetings
set fish_greeting 

# Aliases
if [ -f $HOME/.config/fish/alias.fish ]
    source $HOME/.config/fish/alias.fish
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/xuantung/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# Starship
starship init fish | source

# flatpak
set PATH $PATH:/var/lib/flatpak/sets/bin

# pip packages
set PATH $HOME/.local/bin:$PATH
