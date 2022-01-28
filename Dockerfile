FROM golang:alpine as builder
COPY . "${GOPATH}/src/package/app/"
WORKDIR "${GOPATH}/src/package/app"
RUN apk add --no-cache --upgrade \
		git \
		ca-certificates;
RUN adduser -D -g '' app;
RUN pwd; echo; find "${GOPATH}"; file ./actions; stat ./actions;
RUN go mod tidy;
RUN CGO_ENABLED=0 go build -a -o "/go/bin/main";

FROM scratch
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /go/bin/main /go/bin/main
USER app
WORKDIR "/go/bin"
ENTRYPOINT ["/go/bin/main"]
