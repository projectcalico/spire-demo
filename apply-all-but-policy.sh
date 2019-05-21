#!/bin/bash

set -e

echo
echo "=== Installing Calico ==="
echo
kubectl apply -f 20-calico.yaml
for x in $(seq 50); do
  if kubectl get pod -n kube-system -l k8s-app=calico-node | grep -q 1/1; then
    break
  fi
  sleep 0.2
done

echo
echo "=== Installing SPIRE ==="
echo
kubectl apply -f 30-spire-server.yaml
kubectl apply -f 40-authorization.yaml
for x in $(seq 50); do
  if kubectl get statefulset -n spire spire-server | grep -q 1/1; then
    break
  fi
  sleep 0.2
done
kubectl apply -f 50-spire-agent.yaml
for x in $(seq 50); do
  if kubectl get pod -n spire -l app=spire-agent | grep -q 1/1; then
    break
  fi
  sleep 0.2
done

echo
echo "=== Creating identities ==="
echo
./60-create-entries.sh

echo
echo "=== Installing YAOBank/Envoy/Dikastes ==="
echo
kubectl apply -f 70-yaobank.yaml



