FROM ruby:2.3.0-alpine
MAINTAINER sheaphillips <shea.phillips@gmail.com>

RUN apk update \
  && apk add ruby-dev libpq libgcc ca-certificates make gcc libc-dev libffi-dev \
             nodejs 'python<3' zlib-dev libxml2 libxml2-dev libxslt libxslt-dev \
  && gem install nokogiri -N \
  && gem install jekyll -N \
  && gem install github-pages -N \
  && gem install bundler -N \
  && apk add ruby-json

ADD Gem* /guide/

WORKDIR /guide

RUN bundler && apk del --purge ruby-dev \
                     libgcc gcc make libc-dev libffi-dev zlib-dev libxml2-dev libxslt-dev

ADD . /guide

RUN adduser -S jekyll

RUN chown -R jekyll:0 /guide && chmod -R 770 /guide

USER jekyll


ENV JEKYLL_ENV=production JEKYLL_CONFIG="--config _config.yml"

EXPOSE 4000

CMD ./go serve --host 0.0.0.0 ${JEKYLL_CONFIG}
