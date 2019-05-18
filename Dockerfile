FROM debian:buster

EXPOSE 5000

ENV HOME=/var/lib/rtorrent

WORKDIR /var/lib/rtorrent

RUN apt update && apt install -y rtorrent procps && rm -rf /var/lib/apt/lists*

COPY .rtorrent.rc /var/lib/rtorrent/.rtorrent.rc

RUN mkdir -p /var/lib/rtorrent/session
RUN chmod g=u -R /var/lib/rtorrent
RUN chown 1001:0 -R /var/lib/rtorrent

VOLUME /var/lib/rtorrent

USER 1001
ENTRYPOINT rtorrent
