FROM node:14-alpine

RUN mkdir -p /var/www/current
WORKDIR /var/www/current
ADD . /var/www/current/

RUN yarn global add react-scripts react
RUN yarn install

VOLUME /var/www/current

EXPOSE 3000
CMD yarn start
