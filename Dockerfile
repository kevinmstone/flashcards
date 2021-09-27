# pull the base image
FROM ubuntu:bionic

RUN apt-get update -qq

RUN apt install -y curl
# Install Node & yarn
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -yq nodejs build-essential yarn
# set the working direction

RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y sqlite3

RUN pip3 install flask flask_cors requests numpy


WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./

COPY yarn.lock ./

RUN yarn global add react-scripts

RUN yarn

# add app
COPY . ./

EXPOSE 3000
CMD ["yarn", "start"]
