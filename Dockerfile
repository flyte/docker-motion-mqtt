FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    libavutil-dev \
    libavformat-dev \
    libavcodec-dev \
    libswscale-dev \
    libavdevice-dev \
    libjpeg-dev \
    ffmpeg \
    mosquitto-clients && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY build_motion.sh /build_motion.sh
RUN /build_motion.sh

COPY run_motion.sh /run_motion.sh

EXPOSE 8080
EXPOSE 8081

VOLUME /motion
ENTRYPOINT ["/run_motion.sh"]
CMD ["-c", "/motion/motion.conf"]
