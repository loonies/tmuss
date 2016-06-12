# tmuss(1) Bash completion

_tmuss() {
    local cur prev opts

    COMPREPLY=()

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD - 1]}"

    if [[ "$COMP_CWORD" -ge 2 ]]; then
        return 0
    fi

    case "$cur" in
        -*)
            opts="--help --list --version"
            ;;
        *)
            mapfile -t opts < <(tmuss --list)
            opts=${opts[@]//[-+*]/}
            ;;
    esac

    COMPREPLY=($(compgen -W "$opts" -- "$cur"))
    return 0
}

complete -F _tmuss tmuss
