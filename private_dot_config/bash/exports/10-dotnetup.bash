# Load dotnetup
if [[ -x "$HOME/.dotnetup/dotnetup" ]]; then
    export PATH="${PATH:+$PATH:}$HOME/.dotnetup"

    # Load .NET Tools
    if [[ -d "$DOTNET_ROOT/tools" ]]; then
        export PATH="${PATH:+$PATH:}$DOTNET_ROOT/tools"
    fi
fi
