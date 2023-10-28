FROM ruby:3.2.2

WORKDIR /code
COPY . /code
RUN bundle install

EXPOSE 4567

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
