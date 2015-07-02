#!/bin/bash

set -euo pipefail

declare self="$(realpath "$0")"
declare inst_dir="$(dirname "${self}")"

cd /etc/systemd/system

for item in "${inst_dir}"/*; do
	declare item_name="$(basename "${item#./}")"
	if [ "${item_name}" == "$(basename "$0")" ] || [[ ${item_name} =~ ^\. ]]; then
		continue
	fi
	ln -fsr "${item}" /etc/systemd/system/"$(basename "${item#./}")"
done
