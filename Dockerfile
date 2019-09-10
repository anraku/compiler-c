FROM alpine:3.8

RUN apk add --no-cache gcc make binutils libc-dev
WORKDIR app
