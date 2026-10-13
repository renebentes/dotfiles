# Added by Toolbox App
toolbox_bin="$HOME/.local/share/JetBrains/Toolbox/scripts"
if [[ -d "$toolbox_bin" ]]; then
    PATH="${PATH:+$PATH:}$toolbox_bin"
    export PATH
fi
unset toolbox_bin
