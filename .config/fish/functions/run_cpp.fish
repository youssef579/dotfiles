function run_cpp
    if test (count $argv) -lt 1
        echo "Usage: run_cpp <file.cpp> [-d] [-p]"
        return 1
    end

    set file $argv[1]
    set base (basename $file .cpp)
    set out ".$base.out"

    g++ -g $file -o $out

    # Decide whether to pipe the clipboard
    if contains "p" $argv
        xclip -o -selection clipboard | ./$out
    else
        ./$out
    end

    # Optional cleanup
    if contains "d" $argv
        rm -f $out
    end
end

