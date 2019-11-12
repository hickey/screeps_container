FROM node:10-alpine
MAINTAINER Gerard Hickey <hickey@kinetic-compute.com>


COPY docker-entrypoint.sh /entrypoint.sh
COPY package.json /tmp

RUN apk --update add \
        python \
        make \
        g++ \
 &&     rm -rf /var/cache/apk/* \
 &&     mkdir -p /usr/local/lib/node_modules/screeps/node_modules/isolated-vm/.node-gyp \
 &&     npm install -g screeps \
 &&     adduser -S -g 'Screeps Server' -h '/screeps' screeps-srv

WORKDIR /screeps
USER screeps-srv

EXPOSE 6001
EXPOSE 21025
EXPOSE 21026
EXPOSE 21030


ENTRYPOINT ["/entrypoint.sh"]
CMD ["screeps", "start"]
