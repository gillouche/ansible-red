#!/usr/bin/env bash

verbosity=$1

ansible-playbook -e target_user=$USER -i site.yml --ask-vault-pass --ask-become-pass playbook.yml ${verbosity}

