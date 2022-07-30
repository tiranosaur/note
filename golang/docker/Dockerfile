FROM golang:1.18.3

COPY . /go/src/app
WORKDIR /go/src/app/cmd/gonator
EXPOSE 8080
#EXPOSE 8081
RUN go build -o gonator main.go
CMD ["./gonator"]
