set export

up:
    /bin/bash -c 'cd ./ansible && ansible-playbook -i inventory.ini --ask-vault-password playbook.yaml'

@create-client name:
    /bin/bash ./scripts/wg-create-client.sh ${name}

@create-server host:
    /bin/bash ./scripts/wg-create-server.sh ${host}