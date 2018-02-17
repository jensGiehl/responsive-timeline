FROM node:alpine

ENV WORK_DIR=/opt/work

RUN apk update && apk upgrade && apk --update add \
    ruby ruby-irb ruby-rake ruby-io-console ruby-bigdecimal ruby-json ruby-bundler \
    libstdc++ tzdata bash ca-certificates autoconf \
    &&  echo 'gem: --no-document' > /etc/gemrc

RUN mkdir -p $WORK_DIR

WORKDIR $WORK_DIR

# Add IP address to hosts --> this avoid EAI_AGAIN errors
RUN echo "151.101.128.162 registry.npmjs.org" >> /etc/hosts && \
    npm i -g gulp && \
    gem install sass && \ 
    rm -rf /tmp/*
