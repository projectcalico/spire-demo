#!/bin/bash -x
kubectl apply -f 20-calico.yaml
kubectl apply -f 21-calicoctl.yaml
