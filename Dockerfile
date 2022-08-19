FROM node:14 AS ui-build
WORKDIR /var/www/
COPY ./frontend/ /var/www/frontend/
RUN cd frontend/ && npm install && npm run build

FROM node:14 AS server-build
WORKDIR /var/www/
COPY --from=ui-build /var/www/frontend/build/ /var/www/build/
COPY ./backend/package*.json ./backend/
WORKDIR /var/www/backend/
RUN npm install && npm install --save express@4.16.4
COPY ./backend/. /var/www/backend/
WORKDIR /var/www/backend/

EXPOSE 3333

CMD ["npm","start"]