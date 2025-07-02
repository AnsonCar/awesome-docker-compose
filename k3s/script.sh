cp kubeconfig.yaml ~/.kube/config
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml