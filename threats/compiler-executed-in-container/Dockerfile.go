FROM golang:latest
COPY ./test.go /
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/bin/sh", "-c", "./run.sh"]
