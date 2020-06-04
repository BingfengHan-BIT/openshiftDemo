FROM golang

ENV GOPATH /go
ENV USER root

COPY . /go/src/github.com/BingfengHan-BIT/openshiftDemo

RUN cd /go/src/github.com/BingfengHan-BIT/openshiftDemo \
	&& go get -d -v \
	&& go install \
	&& go test github.com/BingfengHan-BIT/openshiftDemo... \
	&& mkdir -p /go/src/github.com/BingfengHan-BIT/openshiftDemo

WORKDIR /go/src/github.com/BingfengHan-BIT/openshiftDemo

COPY . /go/src/github.com/BingfengHan-BIT/openshiftDemo
RUN go-wrapper download && go-wrapper install

CMD ["go-wrapper", "run"]
