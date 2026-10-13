# Add settings for Android Studio
if [ -d "$HOME/Android/Sdk" ]; then
    export ANDROID_HOME="$HOME/Android/Sdk"
    for android_bin in \
        "$ANDROID_HOME/emulator" \
        "$ANDROID_HOME/tools" \
        "$ANDROID_HOME/platform-tools" \
        "$ANDROID_HOME/cmdline-tools/latest/bin"; do
        if [ -d "$android_bin" ]; then
            PATH="${PATH:+$PATH:}$android_bin"
        fi
    done
    export PATH
    unset android_bin
fi
