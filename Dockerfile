FROM node:lts-alpine as dist
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

FROM nginx
COPY --from=dist /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]