#!/bin/bash

kubectl exec -i -n kube-system calicoctl -- /calicoctl delete -f - < 80-policy.yaml
kubectl delete -f 70-yaobank.yaml
kubectl delete -f 50-spire-agent.yaml
kubectl delete -f 40-authorization.yaml
kubectl delete -f 30-spire-server.yaml


