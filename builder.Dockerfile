FROM golang:1.18.8-buster


ENV SYSL_VERSION=0.604.0
ENV ARRAI_VERSION=0.313.0

WORKDIR /temp-deps/sysl
RUN curl -LJO https://github.com/anz-bank/sysl/releases/download/v"$SYSL_VERSION"/sysl_"$SYSL_VERSION"_linux-amd64.tar.gz && tar -xvf sysl_"$SYSL_VERSION"_linux-amd64.tar.gz && mv sysl /bin/sysl

WORKDIR /temp-deps/arrai
RUN curl -LJO https://github.com/arr-ai/arrai/releases/download/v"$ARRAI_VERSION"/arrai_v"$ARRAI_VERSION"_linux-amd64.tar.gz && tar -xvf arrai_v"$ARRAI_VERSION"_linux-amd64.tar.gz && mv arrai /bin/arrai

WORKDIR /temp-deps/golangci-lint
RUN curl -LJO https://github.com/golangci/golangci-lint/releases/download/v1.48.0/golangci-lint-1.48.0-linux-amd64.tar.gz && tar -xvf golangci-lint-1.48.0-linux-amd64.tar.gz && mv golangci-lint-1.48.0-linux-amd64/golangci-lint /bin/golangci-lint

RUN go install golang.org/x/tools/cmd/goimports@latest

ENTRYPOINT [ "/usr/bin/make" ]
