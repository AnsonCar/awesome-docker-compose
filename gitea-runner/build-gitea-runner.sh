curl https://raw.githubusercontent.com/AnsonCar/awesome-docker-compose/refs/heads/main/gitea-runner/docker-compose.yml > docker-compose.yml 
curl https://raw.githubusercontent.com/AnsonCar/awesome-docker-compose/refs/heads/main/gitea-runner/config.yaml > config.yaml
echo REGISTRATION_TOKEN= >> .env
echo URL=http://gitea.xxxxx.com >> .env
