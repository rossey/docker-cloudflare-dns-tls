Cloudflare DNS Over TLS Resolver in an Alpine Docker Container
=======================================================
Runs unbound in an alpine container configured to use cloudflare's dns servers
using dns over tls. DNSSEC is enforced.

To build: `docker-compose build`

To run `docker-compose run`

[GOGS](https://box.rhowell.io/gogs/ryan/docker-cloudflare-dns-tls)

[GitHub Mirror](https://github.com/TheRyanHowell/docker-cloudflare-dns-tls)

# Pi-Hole Setup

The `docker-compose.pihole.yml` configures the DNS server to listen on
`127.0.0.1:5050`. Pi-Hole will need to be configured to point at this 
using `127.0.0.1#5050` as the DNS server. Note the use of a hash (#) 
for the port declaration instead of the expected colon (:).


### Raspberry Pi 1 use `docker-compose.arm32v6.yml`

    docker-compose -f docker-compose.yml -f docker-compose.arm32v6.yml -f docker-compose.pihole.yml

### Raspberry Pi 2 use `docker-compose.arm32v7.yml`

   docker-compose -f docker-compose.yml -f docker-compose.arm32v7.yml -f docker-compose.pihole.yml

### Raspberry Pi 3+ use `docker-compose.arm64v8.yml`

    docker-compose -f docker-compose.yml -f docker-compose.arm64v8.yml -f docker-compose.pihole.yml


