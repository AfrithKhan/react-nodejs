FROM node:14
WORKDIR /var/www/
COPY package*.json /var/www/

RUN npm install 
RUN npm install --save express
COPY . .
EXPOSE 3333
CMD ["npm","start"]

