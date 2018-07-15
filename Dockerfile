FROM ruby:2.6-rc-alpine

RUN apk update && apk add \
    net-tools \
    build-base \
    mysql-client \
    mysql-dev

# Environment vars
ENV APP_HOME /app

# Config app dir
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Copy codebase into workdir
COPY . $APP_HOME

# Install gems
RUN bundle install

CMD ["rackup", "-p", "3000", "--host", "0.0.0.0"]
