# Create an image based on this existing ruby image
FROM ruby:2.4.1

# Install the software you need
RUN apt-get update \
&& apt-get install -y \
apt-utils \
build-essential \
libpq-dev \
libjpeg-dev \
libpng-dev \
nodejs

# Create a directory for your app
RUN mkdir -p /app

# Copy the files needed for the bundle install
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock

# Set the working directory for all following commands
WORKDIR /app

# Install gems
RUN gem install foreman
RUN bundle install