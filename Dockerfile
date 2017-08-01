FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    libavutil-dev \
    libavformat-dev \
    libavcodec-dev \
    libswscale-dev \
    libavdevice-dev \
    libjpeg-dev \
    ffmpeg \
    mosquitto-clients

WORKDIR /
COPY build_motion.sh /build_motion.sh
RUN /build_motion.sh

EXPOSE 8080
EXPOSE 8081

VOLUME /etc/motion
ENTRYPOINT ["/motion/motion"]
CMD ["-c", "/etc/motion/motion.conf"]
