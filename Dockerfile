FROM alpine:3.9

RUN apk upgrade --update --no-cache && \
    apk add --update --no-cache \
    ca-certificates \
    unbound \
    libcap

RUN setcap 'cap_net_bind_service=+ep' /usr/sbin/unbound

RUN apk del libcap && \
    rm -rf /var/cache/apk/*

COPY unbound.conf /etc/unbound/

RUN wget -O /etc/unbound/root.hints https://www.internic.net/domain/named.cache

RUN chown unbound:unbound -R /etc/unbound && \
    chmod 700 /etc/unbound && \
    chmod 600 /etc/unbound/unbound.conf && \
    chmod 400 /etc/unbound/root.hints

USER unbound

HEALTHCHECK --interval=5m --timeout=15s --start-period=5s --retries=3 \
CMD [ -z $(nslookup cloudflare-dns.com 127.0.0.1 -timeout=1 | grep "no servers could be reached") ] || exit 1

EXPOSE 5353/udp
ENTRYPOINT ["/usr/sbin/unbound"]
