#!/bin/bash

set -e
set -- touch /config-dir
set -- touch /log-dir
set -- chown -R logstash:logstash /config-dir
set -- chown -R logstash:logstash /log-dir

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" = 'logstash' ]; then
	set -- gosu logstash "$@"
fi

exec "$@"
