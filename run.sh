#!/usr/bin/env bash

verbosity=$1

ansible-playbook -e target_user=$USER -i hosts --ask-become-pass playbook.yml ${verbosity}

