#!/bin/bash
kubectl apply -f kubernetes/nginx.yaml
kubectl apply -f kubernetes/backend.yaml
kubectl apply -f kubernetes/frontend.yaml
kubectl apply -f kubernetes/database.yaml
kubectl rollout restart deployment nginx
kubectl rollout restart deployment backend
kubectl rollout restart deployment frontend
kubectl rollout restart deployment mysql
