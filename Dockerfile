FROM sameersbn/debian:jessie.20140918
MAINTAINER sameer@damagehead.com

RUN apt-get update \
 && apt-get install -y rygel tumbler gstreamer1.0-plugins-base \
      gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
      gstreamer1.0-plugins-ugly gstreamer1.0-libav \
 && rm -rf /var/lib/apt/lists/* # 20140918

ADD rygel.conf /.config/

EXPOSE 8000
EXPOSE 1900/udp

VOLUME ["/.cache"]
VOLUME ["/videos"]
VOLUME ["/music"]
VOLUME ["/pictures"]

CMD ["/usr/bin/rygel"]
