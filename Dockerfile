FROM visibilityspots/smashing

# Set environment variables for any gems you want to install
ENV GEMS="net-ping base64"

# Install the specified gems
RUN gem install $GEMS && \
    echo "source 'https://rubygems.org'" > Gemfile && \
    echo "gem 'base64'" >> Gemfile && \
    echo "gem 'smashing', '1.3.6'" >> Gemfile && \
    echo "gem 'net-ping', '~> 2.0', '>= 2.0.8'" >> Gemfile && \
    bundle install

# Move Ping into the container
RUN mkdir /widgets/ping
COPY ./ping/ping.html /widgets/ping/
COPY ./ping/ping.scss /widgets/ping/
COPY ./ping/ping.coffee /widgets/ping/
COPY ./ping/ping.rb /jobs/
COPY ./ping/config.yml /

# Expose the port that Smashing runs on
EXPOSE 3030

# Command to run Smashing
CMD ["smashing", "start"]