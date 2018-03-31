FROM golang:1.10-alpine
WORKDIR /go/src/github.com/hassansin/aws-go-ci/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build .

FROM scratch
COPY --from=0 /go/src/github.com/hassansin/aws-go-ci/ .
ENTRYPOINT ["/app"]
