FROM golang AS hello

WORKDIR /app/src

COPY *.go .

RUN go build -ldflags "-s -w" hello.go

FROM scratch

WORKDIR /app/src

COPY --from=hello /app/src .

CMD ["./hello"]
