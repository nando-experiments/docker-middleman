FROM ruby:2.3
MAINTAINER Fernando Morera "nandomoreira.me@gmail.com"

EXPOSE 4567

RUN bundle config --global frozen 1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      git \
      vim \
      nodejs && \
    apt-get autoclean

RUN usr/sbin/useradd --create-home --home-dir /app --shell /bin/bash docker

VOLUME /app
WORKDIR /app

RUN chown -R docker:docker /app
USER docker

COPY project/Gemfile* /app/
RUN bundle install

ENTRYPOINT ["bundle", "exec", "middleman"]
CMD ["server"]
