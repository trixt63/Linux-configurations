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
# eval /home/xuantung/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


# Starship
starship init fish | source

# flatpak
fish_add_path -gaP /var/lib/flatpak/exports/bin

# pip packages
fish_add_path -gP $HOME/.local/bin

# airflow
set -gx AIRFLOW_HOME ~/Tovchain/airflow-cluster

# Spark
set -gx SPARK_HOME $HOME/.spark
fish_add_path -gP $SPARK_HOME/bin

# rofi scripts (launcher_t*, powermenu_t*), used by Qtile/XFCE shortcuts
fish_add_path -gaP $HOME/.config/rofi/scripts

# horizon omnissa client
set LD_LIBRARY_PATH /usr/lib/omnissa
# Added by dbt Fusion extension
alias dbtf "/home/trinhtung/.local/bin/dbt"
