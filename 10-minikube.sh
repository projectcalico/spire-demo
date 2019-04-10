#!/bin/bash

minikube start --host-only-cidr 172.17.17.1/24 \
               --network-plugin=cni \
               --enable-default-cni \
               --extra-config=kubelet.network-plugin=cni \
               --extra-config=kubelet.pod-cidr=192.168.0.0/16 \
               --extra-config=controller-manager.cluster-cidr=192.168.0.0/16 \
               --extra-config=controller-manager.allocate-node-cidrs=true
