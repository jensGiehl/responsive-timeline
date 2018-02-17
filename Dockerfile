FROM node:latest

ENV WORK_DIR=/opt/work

RUN mkdir -p $WORK_DIR && npm install --global gulp-cli

RUN apt-get -yq update && apt-get -yq install ruby ruby-dev

RUN gem install sass --no-user-install

WORKDIR $WORK_DIR
