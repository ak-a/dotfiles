#!/bin/bash

[[ -z $TMUX ]] && exit 1

session="${1:-default}"

config_dir=${$0%/*}
[[ ${config_dir} == $0 ]] && config_dir=$(pwd)

session_config=${config_dir}/default.conf
[[ -r ${config_dir}/${session}.conf ]]  && session_config=${config_dir}/${session}.conf

[[ -r ${session_config} ]] || exit 2

tmux source-file "$session_config"
