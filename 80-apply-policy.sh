#!/bin/sh -x
kubectl exec -i -n kube-system calicoctl -- /calicoctl apply -f - < 80-policy.yaml

