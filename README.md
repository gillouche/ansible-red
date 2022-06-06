# ansible-red
Configure kali, blackarch, ... VM or bare.

This is in addition to the [dotfiles](https://github.com/gillouche/dotfiles) repository.

This playbook only supports BlackArch Linux for the moment.

## Requirements

* python3 and pip, possibly python3-venv
* OS stuff: Xorg, DE, GPU drivers, ...

## Vault
Some config files are encrypted

* roles/vpn/files/*
* roles/tools_recon uses nessus_key from secret.yml so nessus setup needs to be removed or this variable needs to be found in the vault with the key for nessus activation

Remove them and remove "--ask-vault-pass" from run.sh script.

## Install

```bash
python3 -m venv venv
source venv/bin/activate
pip3 install -r requirements.txt

bash run.sh
```

Additionally, the verbosity can be passed to the script

```bash
bash run.sh -vvvv
```

which will print the facts and exits.
