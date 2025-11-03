# Load Angular CLI autocompletion.
if hash ng 2>/dev/null; then
    # shellcheck source=/dev/null
    source <(ng completion script)
fi
