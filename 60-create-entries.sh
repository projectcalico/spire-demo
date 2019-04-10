#!/bin/bash
SPIRE='kubectl exec -ti -n spire spire-server-0 -- /opt/spire/bin/spire-server'

$SPIRE entry create -spiffeID spiffe://example.org/k8s -selector k8s_sat:cluster:demo-cluster -node
$SPIRE entry create -spiffeID spiffe://example.org/ns/default/sa/customer -selector k8s:ns:default -selector k8s:sa:customer -parentID spiffe://example.org/k8s
$SPIRE entry create -spiffeID spiffe://example.org/ns/default/sa/customer -selector k8s:ns:default -selector k8s:sa:summary -parentID spiffe://example.org/k8s
$SPIRE entry create -spiffeID spiffe://example.org/ns/default/sa/customer -selector k8s:ns:default -selector k8s:sa:database -parentID spiffe://example.org/k8s