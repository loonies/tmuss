#compdef tmuss

# tmuss(1) zsh completion

_tmuss() {
    typeset -A opt_args
    local context state line

    if [[ ${#words[@]} -ge 3 ]]; then
        return 0
    fi

    case "$words[2]" in
        -*)
            _arguments \
                '(- 1 *)'{-h,--help}'[print help]' \
                '(- 1 *)'{-l,--list}'[list all available profiles]' \
                '(- 1 *)--version[print program version]'
            ;;

        *)
            profiles=("${${(@f)$(tmuss --list)}[@]:1}")
            profiles=("${profiles[@]//[-+* ]/}")

            _describe 'profile' profiles
            ;;
    esac

    return 0
}

_tmuss "$@"
