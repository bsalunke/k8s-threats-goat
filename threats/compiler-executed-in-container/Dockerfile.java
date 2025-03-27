FROM openjdk:latest
COPY Test.java /
COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD ["/bin/sh", "-c", "./run.sh"]
