if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
    zoxide init fish | source
    set -gx EDITOR nvim
    set -gx XCURSOR_THEME "/usr/share/icons/Obsidian"
    set -gx XCURSOR_SIZE 25
    set -gx BAT_THEME everforest-soft
    fish_vi_key_bindings
    set fish_greeting
end

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# if test -f /home/youssef/miniconda3/bin/conda
#     eval /home/youssef/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# else
#     if test -f "/home/youssef/miniconda3/etc/fish/conf.d/conda.fish"
#         . "/home/youssef/miniconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH "/home/youssef/miniconda3/bin" $PATH
#     end
# end
# # <<< conda initialize <<<

