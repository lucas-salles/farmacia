FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /farmacia
COPY Gemfile /farmacia/Gemfile
COPY Gemfile.lock /farmacia/Gemfile.lock
RUN bundle install
COPY . /farmacia

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3001

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]