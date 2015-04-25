#!/bin/sh

NODE_UUID=$(vagrant ssh -- sudo cat /etc/tutum/agent/tutum-agent.conf | egrep -o 'TutumUUID":"[^"]+' | awk -F ':"' '{print $2}')
curl -H "Authorization: ApiKey ${TUTUM_USER}:${TUTUM_API_KEY}" -X DELETE https://dashboard.tutum.co/api/v1/node/${NODE_UUID}/
