ARG RUBY_VERSION_TAG=2.6-slim
FROM ruby:${RUBY_VERSION_TAG}

WORKDIR /app

RUN gem uninstall bundler && gem install bundler:2.0.2
COPY Gemfile* ./
RUN gem uninstall bundler \
  && gem install bundler:2.0.2 \
  && bundle install --path vendor/bundle

EXPOSE 4567
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]
