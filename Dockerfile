FROM scratch

ADD rootfs.tar.gz /

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y

CMD ["/bin/bash"]
