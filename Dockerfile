FROM alpine:3.7

MAINTAINER Tito Nobre <titonobre@gmail.com>

RUN apk update && apk add --no-cache curl lftp libc6-compat nodejs nodejs-npm
