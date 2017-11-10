FROM node:6-alpine
MAINTAINER Gerard Hickey <hickey@kinetic-compute.com>

RUN apk --update add \
        python \
        make \
        g++ \
 &&     rm -rf /var/cache/apk/* \
 &&     npm install -g screeps \
 &&     adduser -S -g 'Screeps Server' -h '/screeps' screeps-srv

COPY docker-entrypoint.sh /entrypoint.sh

WORKDIR /screeps
USER screeps-srv

ENTRYPOINT ["/entrypoint.sh"]
CMD ["screeps", "start"]
