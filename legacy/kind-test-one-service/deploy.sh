kind delete cluster --name micro-kino-cluster
# create cluster
kind create cluster --config kind-cluster.yml

## create postgres
kubectl apply -f postgres/postgres-deployment.yml
kubectl apply -f postgres/postgres-service.yml

## create secrets
kubectl apply -f dockerconfigjson.yml

## create service
kubectl apply -f deployment.yml
kubectl apply -f service.yml


echo "Set Port Forwarding with specific service name. Have a look into the Shell Script for more details."
## find name with the following command:
echo $(kubectl get pods -l app=cinema-service -o custom-columns=:metadata.name)

## port-forward
kubectl port-forward cinema-service-78d55fd998-hftcd -n default 8090:8090