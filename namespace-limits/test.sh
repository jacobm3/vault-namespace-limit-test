#!/bin/bash -x

for x in $(seq -w 1 1000); do
  for y in $(seq -w 1 10); do
    COUNT=$(vault namespace list -format=json | grep '"' | wc -l)
    echo "Namespace count: $COUNT" >> ns.log
    
    curl -s -H "X-Vault-Token: $(cat ~/.vault-token)" $VAULT_ADDR/v1/sys/metrics \
      | jq  '.Gauges[] | select( .Name | contains("mount_table.size") )' >> ns.log
    
    vault namespace create $x.$y
    vault secrets enable -namespace $x.$y -version 2 kv

  done
done
