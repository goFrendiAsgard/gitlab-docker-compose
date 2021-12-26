# Setting gitlab runner (that works)

## Step 1: Docker compose up

```sh
docker-compose up
```

## Step 2: Open the gitlab interface

```
http://host.docker.internal:8929
```

Login with this credentials:

* user: `root`
* password: `toortoor`

Note: the password has to be at least 8 characters

## Step 3: Register runner

Open CI/CD setting in your gitlab interface, expand on `runners`, take note for registration token. In my case, it is: `PGmsFu9vzWa1vKctWoQH`

Then, invoke this:

```sh
docker exec gitlab_runner_1 \
    gitlab-runner register \
    --non-interactive \
    --url http://host.docker.internal:8929/ \
    --registration-token PGmsFu9vzWa1vKctWoQH \
    --executor docker \
    --description "Sample Runner 1" \
    --docker-image "docker:stable" \
    --docker-volumes /var/run/docker.sock:/var/run/docker.sock
```

## Step 4: Clone default repo named monitoring

## Step 5: Add .gitlab-ci.yml

```yml
stages:
  - test
  - build
  - deploy

build-job:
  stage: test
  script:
    - echo "Hello, $GITLAB_USER_LOGIN!"
```

## Step 6: Push back and watch the pipeline# gitlab-docker-compose
