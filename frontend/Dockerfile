FROM node:16 as node

WORKDIR /app
COPY ./app .
COPY ./nginx.conf /
RUN npm install && npm install -g @angular/cli && ng build

## Docker multi step
FROM nginx:alpine
COPY --from=node /app/dist/letscodebyada-app /usr/share/nginx/html
COPY --from=node /nginx.conf /etc/nginx/conf.d/default.conf