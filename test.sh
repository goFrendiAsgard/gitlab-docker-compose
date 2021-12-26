set -e
docker-compose down
docker volume prune -f
sudo rm -Rf gitlab gitlab-runner
docker-compose up -d
sudo chmod -R 777 gitlab gitlab-runner

# get your token by visiting settings CI/CD
# docker exec gitlab_runner_1 \
#     gitlab-runner register \
#     --non-interactive \
#     --url http://host.docker.internal:8929/ \
#     --registration-token PGmsFu9vzWa1vKctWoQH \
#     --executor docker \
#     --description "Sample Runner 1" \
#     --docker-image "docker:stable" \
#     --docker-volumes /var/run/docker.sock:/var/run/docker.sock