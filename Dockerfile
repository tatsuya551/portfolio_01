FROM ruby:2.5.1
RUN apt-get update -qq \
    && apt-get install -y build-essential nodejs --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq \
    && apt-get install -y vim --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app