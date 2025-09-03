function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

run_cpp() {
    if [ -z "$1" ]; then
        echo "Usage: run_cpp <file.cpp> [-d] [-p]"
        return 1
    fi

    file="$1"
    base=$(basename "$file" .cpp)
    out=".$base.out"

    g++ "$file" -o "$out"

    # Decide whether to pipe the clipboard
    if [[ "$2" = "-p" || "$3" = "-p" ]]; then
        xclip -o -se c | "./$out"
    else
        "./$out"
    fi

    # Check for optional cleanup
    if [[ "$2" = "-d" || "$3" = "-d" ]]; then
        rm -f "$out"
    fi
}
