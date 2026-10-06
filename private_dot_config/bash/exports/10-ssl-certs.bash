#!/bin/bash
# Include Development certificates
export SSL_CERT_DIR="$HOME/.aspnet/dev-certs/trust:$HOMEBREW_PREFIX/etc/openssl@3/certs"
