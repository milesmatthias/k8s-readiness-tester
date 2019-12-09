FROM ruby:2.6.3-slim

COPY server.rb .

CMD ruby server.rb
