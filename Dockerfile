FROM node:alpine

WORKDIR '/usr/app'

COPY package.json .
RUN npm install
RUN npm install -g npm@8.4.0
COPY . .

CMD ["npm","start"]