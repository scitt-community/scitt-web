FROM  ruby:2.7-alpine3.15

# Add Jeykyll dependence
RUN apk update
RUN apk add --no-cache build-base gcc cmake git

# Update the Ruby bundler and install Jekyll

RUN gem update bundler  && gem install bundler jekyll
