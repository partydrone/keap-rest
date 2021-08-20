FROM ruby:3.0
LABEL author="Andrew Porter <partydrone@icloud.com>"

ENV GEM_NAME infusionsoft-rest

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /opt/gem

COPY lib/${GEM_NAME}/version.rb ./lib/${GEM_NAME}/version.rb
COPY Gemfile* *.gemspec ./
RUN bundle install
COPY . .
