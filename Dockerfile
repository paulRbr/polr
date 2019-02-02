FROM ruby:2.5-alpine

WORKDIR /app
COPY gems.rb gems.locked /app/

RUN apk add --update --virtual=.build-deps git ruby-dev build-base && \
    apk add tzdata libxml2-dev libxslt-dev sqlite-dev && \
    bundle install --without development test && \
    apk del .build-deps && \
    rm -rf /var/cache/apk/*

COPY . /app
CMD ["bundle", "exec", "rails", "server", "--binding=0.0.0.0"]
