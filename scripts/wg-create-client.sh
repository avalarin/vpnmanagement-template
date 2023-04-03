#! /bin/sh

client_name=$1
if [ -z "$client_name" ]; then
    echo 'You should specify name for the new client'
    exit 1
fi

client_seqnum=10
client_privkey=$(wg genkey)
client_pubkey=$(echo $client_privkey | wg pubkey)
client_enc_privkey=$(ansible-vault encrypt_string --ask-vault-password "$client_privkey")

cat <<EOF
    client_name: ${client_name}
    client_seqnum: ${client_seqnum}
    client_privkey: ${client_enc_privkey}
    client_pubkey: ${client_pubkey}
EOF