# Cleaning path duplicate entries
OLDPATH="$PATH"
NEWPATH=""
colon=""
while [ "${OLDPATH#*:}" != "$OLDPATH" ]; do
    entry="${OLDPATH%%:*}"
    search=":${OLDPATH#*:}:"
    [ "${search#*:$entry:}" == "$search" ] && NEWPATH="$NEWPATH$colon$entry" && colon=:
    OLDPATH="${OLDPATH#*:}"
done
NEWPATH="$NEWPATH:$OLDPATH"
export PATH="$NEWPATH"
