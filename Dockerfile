ARG RUBY_VERSION=2.6-slim
FROM ruby:${RUBY_VERSION}
WORKDIR /app
RUN gem uninstall bundler && gem install bundler:2.0.2
COPY Gemfile* ./
RUN bundle install --path vendor/bundle
