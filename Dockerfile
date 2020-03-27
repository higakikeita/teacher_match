FROM ruby:2.5.1 
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs
RUN mkdir /teacher_match
WORKDIR /teacher_match
COPY Gemfile /teacher_match/Gemfile
# COPY Gemfile.lock /teacher_match/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /teacher_match

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
