#!/usr/bin/env bash

verbosity=$1

ansible-playbook -e target_user=$USER -i hosts.yml --ask-vault-pass --ask-become-pass site.yml ${verbosity}

