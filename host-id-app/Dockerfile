FROM alpine:3.5

### >>>> place MAINTAINER instruction here ###

### >>>> place RUN instruction here to create the working directory  ### 
### >>>> place WORKDIR instruction here to set the working directory ###

RUN \
  apk add nodejs --update-cache && \
  npm install -g npm@latest && \
  rm -rf \
    /usr/share/man \
    /tmp/* \
    /var/cache/apk/* \
    /root/.npm \
    /root/.node-gyp \
    /usr/lib/node_modules/npm/man \
    /usr/lib/node_modules/npm/doc \
    /usr/lib/node_modules/npm/html

RUN \
  apk --no-cache add \
    libc6-compat \
    git

ENV TINI_VERSION=0.13.2 TINI_SHA=afbf8de8a63ce8e4f18cb3f34dfdbbd354af68a1
RUN apk add --update curl && \
    apk add git && \
    rm -rf /var/cache/apk/* && \
    curl -fsSL https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini-static-amd64 -o /bin/tini && chmod +x /bin/tini \
    && echo "$TINI_SHA  /bin/tini" | sha1sum -c - \
    && git config --global url.https://github.com/.insteadOf git://github.com/ && mkdir -p /home/rtb/logs

### >>>> place the COPY instruction here to copy the host-id-app (.) content to the working directory

RUN npm install --production
ENTRYPOINT ["/bin/tini", "--", "npm", "start"]

### >>>> place EXPOSE instruction here with the correct port ### 
