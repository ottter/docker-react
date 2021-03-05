FROM node:alpine

WORKDIR /app

COPY package*.json ./
RUN npm install -g npm@7.6.0
RUN npm install -g react-scripts
COPY . .
RUN npm run build

FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html
