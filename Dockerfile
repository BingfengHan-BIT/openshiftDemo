FROM golang:latest

ENV GOPATH /go
ENV USER root
ENV PORT 8080

COPY . /go/src/github.com/BingfengHan-BIT/openshiftDemo

RUN cd /go/src/github.com/BingfengHan-BIT/openshiftDemo \
	&& go get -d -v \
	&& go install \
	&& go test github.com/BingfengHan-BIT/openshiftDemo... \
	&& mkdir -p /go/src/github.com/BingfengHan-BIT/openshiftDemo

WORKDIR /go/src/github.com/BingfengHan-BIT/openshiftDemo

COPY . /go/src/github.com/BingfengHan-BIT/openshiftDemo
RUN go-wrapper download
RUN go-wrapper install

EXPOSE 8080
CMD ["go-wrapper", "run"]
