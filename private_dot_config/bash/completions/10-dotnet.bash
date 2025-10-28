# bash parameter completion for the dotnet CLI
if hash dotnet 2>/dev/null; then
    _dotnet_bash_complete() {
        local word=${COMP_WORDS[COMP_CWORD]} IFS=$'\n'
        local candidates

        read -d '' -ra candidates < <(dotnet complete --position "${COMP_POINT}" "${COMP_LINE}" 2>/dev/null)
        read -d '' -ra COMPREPLY < <(compgen -W "${candidates[*]:-}" -- "$word")
    }
    complete -f -F _dotnet_bash_complete dotnet
fi
