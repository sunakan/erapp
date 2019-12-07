ARG RUBY_IMAGE_TAG
FROM ruby:${RUBY_IMAGE_TAG}

WORKDIR /app

RUN gem uninstall bundler && gem install bundler:2.0.2
COPY Gemfile* ./
RUN gem uninstall bundler \
  && gem install bundler:2.0.2 \
  && bundle install --path vendor/bundle

COPY app.rb ./

EXPOSE 4567
CMD ["bundle", "exec", "ruby", "app.rb", "-o", "0.0.0.0"]
