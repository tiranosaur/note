FROM ruby:3.0.0
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client ruby
ADD . /Rails-Docker
WORKDIR /Rails-Docker
RUN gem install bundler
RUN ruby -v
RUN gem list
RUN bundle install
EXPOSE 3000
CMD ["bash"]
