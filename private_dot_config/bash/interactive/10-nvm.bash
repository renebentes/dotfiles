# Loads nvm
if [[ -n ${HOMEBREW_PREFIX:-} && -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]]; then
    export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
    # shellcheck source=/dev/null
    . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
fi
