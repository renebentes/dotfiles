# Load .NET
if [[ -d "$HOME/.dotnet" ]]; then
    export DOTNET_ROOT="$HOME/.dotnet"
    PATH="${PATH:+$PATH:}$DOTNET_ROOT"
    if [[ -d "$DOTNET_ROOT/tools" ]]; then
        PATH="$PATH:$DOTNET_ROOT/tools"
    fi
    export PATH
fi