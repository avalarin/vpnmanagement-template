# vpnmanagement

Ansible playbook to setup vpn servers and clients

## Prepare

Don't forget to install `ansible` locally. Also you need [just](https://github.com/casey/just) installed, but instead of using `just`, you can copy and execute commands from `./justfile` manually..

## Security

All keys stored in `ansble/group_vars/all.yaml` are encrypted. You will be asked for 
your vault password every time. Store the vault password safely, it will be impossible 
to restore keys in case of losing it.

## Add a new server
1. Create a new server somewhere and copy its IP
2. Call `just create-server <ip>` (you will be asked for the your vault password)
3. Add new line to `ansible/templates/inventory.ini` by example
4. Add new server to the servers block in `ansble/group_vars/all.yaml`
5. Call `just up`

## Create a new client

1. Call `just create-client <client-name>` (you will be asked for the your vault password)
2. Copy output to the end of `ansble/group_vars/all.yaml`
3. Ensure that client_seqnum has unique number
4. Call `just up`
5. Look for client's configuration file in configs dirs (or QR code)

## See documentation

https://hackernoon.com/how-to-automate-your-vpn-setup-with-ansible-nl3133ri
