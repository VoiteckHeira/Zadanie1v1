# etap 1 - pobranie zależności i skompilowanie aplikacji
FROM node:14.17.0-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# etap 2 - przygotowanie obrazu produkcyjnego
FROM node:14.17.0-alpine
WORKDIR /app
COPY --from=build /app/build ./
RUN npm install -g serve
HEALTHCHECK --interval=5m --timeout=3s \
    CMD wget --quiet --tries=1 --spider http://localhost:5000 || exit 1
EXPOSE 5000
CMD ["serve", "-s", "."]

# metadane
LABEL author="Jan Kowalski"
LABEL date="2023-05-01"