FROM debian:stretch

RUN sed -i "s/stretch main/stretch main contrib non-free/" /etc/apt/sources.list
RUN echo "deb http://www.deb-multimedia.org stretch main non-free" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --force-yes deb-multimedia-keyring mosquitto-clients
RUN apt-get update

RUN apt-get install -y \
    libavutil-dev \
    libavformat-dev \
    libavcodec-dev \
    libswscale-dev \
    libavdevice-dev \
    libjpeg-dev \
    ffmpeg

WORKDIR /
COPY build_motion.sh /build_motion.sh
RUN /build_motion.sh

EXPOSE 8080
EXPOSE 8081

VOLUME /etc/motion
ENTRYPOINT ["/motion/motion"]
CMD ["-c", "/etc/motion/motion.conf"]
