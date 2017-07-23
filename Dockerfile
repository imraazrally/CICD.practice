FROM 'ruby:2.3.4'
RUN gem install rails
RUN gem install bundler

RUN mkdir /var/app && mkdir /var/app/current
RUN apt-get update
RUN apt-get install curl
RUN apt-get install -y mysql-client 

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash
RUN apt-get install nodejs -y

WORKDIR /var/app/current

ADD src/Gemfile .
RUN bundle install
RUN bundle package --all

EXPOSE 3000

CMD /var/app/current/start.sh