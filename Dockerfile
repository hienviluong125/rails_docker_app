FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler -v 2.2.11 && bundle install

COPY . /myapp
