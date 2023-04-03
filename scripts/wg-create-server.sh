
#! /bin/sh

server_host=$1
if [ -z "$server_host" ]; then
    echo 'You should specify ip or hostmane for the new server'
    exit 1
fi

server_privkey=$(wg genkey)
server_pubkey=$(echo $server_privkey | wg pubkey)
server_enc_privkey=$(ansible-vault encrypt_string --ask-vault-password "$server_privkey")

cat <<EOF
  - server_host: ${server_host}
    server_network: 10.11.0
    server_privkey: ${server_enc_privkey}
    server_pubkey: ${server_pubkey}
EOF