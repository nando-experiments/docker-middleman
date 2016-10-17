FROM ruby:2.3
MAINTAINER Fernando Morera "nandomoreira.me@gmail.com"

EXPOSE 4567

RUN bundle config --global frozen 1

RUN apt-get update && \
    apt-get install -y \
    vim \
    curl \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    nodejs && \
    apt-get autoclean

VOLUME /var/www/middleman
WORKDIR /var/www/middleman

ONBUILD COPY Gemfile /var/www/middleman/
ONBUILD COPY Gemfile.lock /var/www/middleman/
ONBUILD RUN bundle install
ONBUILD COPY . /var/www/middleman
ONBUILD RUN bundle exec puma -p 4567

