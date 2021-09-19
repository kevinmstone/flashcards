# pull the base image
FROM node:lts-alpine

# set the working direction
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
