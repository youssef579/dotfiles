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
set -gx DMS_DISABLE_MATUGEN 1
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

# You must call it on initialization or listening to directory switching won't work
# load_nvm > /dev/stderr
function nvm
  bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

set -x NVM_DIR ~/.nvm
nvm use default --silent

# pnpm
set -gx PNPM_HOME "/home/youssef/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# # pnpm end
