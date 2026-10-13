if [[ ${BASH_ENVIRONMENT_LOADED:-} != 1 ]]; then
    BASH_ENVIRONMENT_LOADED=1

    for f in "$HOME"/.config/bash/exports/*.bash; do
        [[ -f "$f" ]] || continue
        # shellcheck source=/dev/null
        . "$f"
    done

    unset f
fi
