ARG RUBY_VERSION=2.6-slim
FROM ruby:${RUBY_VERSION}
WORKDIR /app
RUN gem uninstall bundler && gem install bundler
COPY Gemfile* ./
RUN bundle install --path vendor/bundle
