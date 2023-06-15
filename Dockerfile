# Dockerfile
FROM alpine:latest as builder
LABEL maintainer="mengbin1992@outlook.com"

RUN apk update && apk add git

WORKDIR /root
RUN git clone -b gh-pages https://github.com/ethereum/remix-live.git remix && cd remix && rm -rf .git


FROM nginx:alpine
LABEL maintainer="mengbin1992@outlook.com"

WORKDIR /app

COPY --from=builder /root/remix /usr/share/nginx/html/

EXPOSE 80