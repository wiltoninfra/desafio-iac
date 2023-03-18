#stage 1
FROM node:16 as node

WORKDIR /app

COPY ./app .
COPY ./nginx.conf /
RUN npm install
RUN npm install -g @angular/cli
RUN ng build
#CMD ["ng","serve","--host", "0.0.0.0"]

#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/letscodebyada-app /usr/share/nginx/html
COPY --from=node /nginx.conf /etc/nginx/conf.d/default.conf