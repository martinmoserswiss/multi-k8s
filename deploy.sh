docker build -t martinmoserswiss/multi-client:latest -t martinmoserswiss/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t martinmoserswiss/multi-server:latest -t martinmoserswiss/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t martinmoserswiss/multi-worker:latest -t martinmoserswiss/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push martinmoserswiss/multi-client:latest
docker push martinmoserswiss/multi-server:latest
docker push martinmoserswiss/multi-worker:latest
docker push martinmoserswiss/multi-client:$SHA
docker push martinmoserswiss/multi-server:$SHA
docker push martinmoserswiss/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=martinmoserswiss/multi-server:$SHA
kubectl set image deployments/client-deployment client=martinmoserswiss/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=martinmoserswiss/multi-worker:$SHA