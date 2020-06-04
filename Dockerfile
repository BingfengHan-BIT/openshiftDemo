FROM golang

ENV GOPATH /go
ENV USER root

COPY . /go/src/github.com/BingfengHan-BIT/openshifthello

RUN cd /go/src/github.com/BingfengHan-BIT/openshifthello \
	&& go get -d -v \
	&& go install \
	&& go test github.com/BingfengHan-BIT/openshifthello... \
	&& mkdir -p /go/src/github.com/BingfengHan-BIT/openshifthello

WORKDIR /go/src/github.com/BingfengHan-BIT/openshifthello

COPY . /go/src/github.com/BingfengHan-BIT/openshifthello
RUN go-wrapper download && go-wrapper install

CMD ["go-wrapper", "run"]
