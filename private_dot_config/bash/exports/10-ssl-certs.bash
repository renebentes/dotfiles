# Include Development certificates
ssl_cert_dirs=()
IFS=: read -r -a ssl_cert_dirs <<< "${SSL_CERT_DIR:-}"

for cert_dir in "$HOME/.aspnet/dev-certs/trust" \
    "${HOMEBREW_PREFIX:+$HOMEBREW_PREFIX/etc/openssl@3/certs}"; do
    [[ -n "$cert_dir" && -d "$cert_dir" ]] || continue

    found=false
    for existing_cert_dir in "${ssl_cert_dirs[@]}"; do
        if [[ "$cert_dir" == "$existing_cert_dir" ]]; then
            found=true
            break
        fi
    done

    [[ "$found" == true ]] || ssl_cert_dirs+=("$cert_dir")
done

if ((${#ssl_cert_dirs[@]})); then
    SSL_CERT_DIR=$(IFS=:; printf '%s' "${ssl_cert_dirs[*]}")
    export SSL_CERT_DIR
fi

unset ssl_cert_dirs cert_dir existing_cert_dir found
