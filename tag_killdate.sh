#!/usr/local/bin/bash
set -euo pipefail
IFS=$'\n\t'

TF_VAR_tag_killdate=$(gdate '+%d/%m/%Y' -d "+3 days")
export TF_VAR_tag_killdate
