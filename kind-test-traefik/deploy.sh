kind delete cluster --name micro-kino-cluster

# create cluster
kind create cluster --config kind-cluster.yml

## create traefik
#https://medium.com/kubernetes-tutorials/deploying-traefik-as-ingress-controller-for-your-kubernetes-cluster-b03a0672ae0c
kubectl create -f traefik/traefik-service-acc.yaml \
  -f traefik/traefik-cr.yaml \
  -f traefik/traefik-crb.yaml \
  -f traefik/traefik-deployment.yaml \
  -f traefik/traefik-svc.yaml \
  -f traefik/traefik-webui-svc.yaml \
  -f traefik/traefik-ingress.yaml
# \
### create postgres
#kubectl apply -f postgres/postgres-deployment.yml \
#  -f postgres/postgres-service.yml
#
### create secrets
#kubectl apply -f dockerconfigjson.yml
#
### create service
#kubectl apply -f deployment.yml \
#  -f service.yml
#
#
#echo "Set Port Forwarding with specific service name. Have a look into the Shell Script for more details."
## find name with the following command:
#echo $(kubectl get pods -l app=cinema-service -o custom-columns=:metadata.name)

## port-forward
#kubectl port-forward cinema-service-78d55fd998-hftcd -n default 8090:8090