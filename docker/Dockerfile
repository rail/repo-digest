FROM golang:1.16
ENTRYPOINT /entrypoint.sh
ENV WORKDIR /build
WORKDIR $WORKDIR
COPY . .

RUN docker/build.sh
