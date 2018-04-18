# Publishing Tools

## Why?

I needed simple a way to build a modern website and deploy it to a old school server via FTP.
This image aggregates some tools for the job:
- [NodeJS](https://nodejs.org/)
- [LFTP](http://lftp.tech/)


## Usage Examples

### Wercker

```yaml
box: titonobre/publishing-tools:latest
build:
  steps:
    - npm-install
    - script:
        name: generate
        code: npm run generate
    - script:
        name: deploy
        code: lftp -e 'mirror --delete --skip-noaccess --exclude=.ftpquota --reverse --use-pget-n=5 --parallel=5 dist/ /; exit' --user $DEPLOY_FTP_USER --password $DEPLOY_FTP_PASS $DEPLOY_FTP_SERVER
```


### Bitbucket Pipelines

```yaml
image: titonobre/publishing-tools:latest
pipelines:
  default:
    - step:
        caches:
          - node
        script:
          - npm install
          - npm run generate
          - lftp -e 'mirror --delete --skip-noaccess --exclude=.ftpquota --reverse --use-pget-n=5 --parallel=5 dist/ /; exit' --user $DEPLOY_FTP_USER --password $DEPLOY_FTP_PASS $DEPLOY_FTP_SERVER
```


## Notes

### Build the Image

```bash
docker build -t titonobre/publishing-tools .
```


### Run a Shell on the container

```
docker run --rm -it titonobre/publishing-tools /bin/sh
```


### Publish Image

```
docker push titonobre/publishing-tools
```
