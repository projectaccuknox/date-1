FROM golang:alpine as build
RUN apk --no-cache add tzdata
EXPOSE 8080
WORKDIR /app
ADD . .
RUN CGO_ENABLED=0 GOOS=linux go build -o myapp
FROM scratch as final
COPY --from=build /app/myapp .
COPY --from=build /usr/share/zoneinfo/Asia/Calcutta /usr/share/zoneinfo/Asia/Calcutta
ENV TZ=Asia/Calcutta
CMD ["/myapp"]
