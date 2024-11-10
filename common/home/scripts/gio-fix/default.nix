{ pkgs, ... }:
let
    gnome-terminal = pkgs.writeShellScriptBin "gnome-terminal" ''
        for terminal in "$TERMINAL" gnome-terminal alacritty kitty
        do
        if command -v "$terminal" > /dev/null 2>&1
        then
            if ! [ "$terminal" = "gnome-terminal" ]
            then
                i=1
                until [ $# -lt $i ]
                do
                    arg=$1
                    case "$arg" in
                        -x|--execute|--)
                            shift; set -- "$@" '-e'
                            ;;
                        *)
                            shift; set -- "$@" "$arg"
                            ;;
                    esac
                    i=$((i+1))
                done
                exec /usr/bin/gnome-terminal "$@"
            else
                exec "$terminal" "$@"
            fi
        fi
    done
    '';
in {
    home.packages = [ gnome-terminal ];
}