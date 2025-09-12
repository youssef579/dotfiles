if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
    zoxide init fish | source
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    set -gx EDITOR nvim
    fish_vi_key_bindings --no-erase
    set fish_greeting
end
