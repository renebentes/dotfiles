# Load .NET
if [ -d $HOME/.dotnet ]; then
    export DOTNET_ROOT=$HOME/.dotnet
    export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
fi