FROM jnewland/motion

RUN apt-get update
RUN apt-get install -y mosquitto-clients
RUN apt-get purge -y \
    autoconf \
    curl \
    build-essential \
    git \
    libtool \
    locales \
    wget \
    x264
RUN apt-get autoremove --purge -y
RUN apt-get clean

EXPOSE 8080
EXPOSE 8081

VOLUME /etc/motion
ENTRYPOINT ["/motion/motion"]
CMD ["-c", "/etc/motion/motion.conf"]
