# Load dotnetup
if [[ -x "$HOME/.dotnetup/dotnetup" ]]; then
    export PATH="$HOME/.dotnetup:$PATH"
fi

# Load .NET Tools
if [ -d "$DOTNET_ROOT" ]; then
    export PATH="$PATH:$DOTNET_ROOT/tools"
fi
