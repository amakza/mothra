FROM ruby:2.3.1
RUN apt-get update -qq && \
    apt-get install -y apt-utils \
                       build-essential \
                       libpq-dev \
                       nodejs \
                       mysql-client \
                       vim
WORKDIR /web
ADD ./web /web
RUN bundle install
EXPOSE 3000
