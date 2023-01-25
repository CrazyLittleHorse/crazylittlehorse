FROM node:18-alpine AS builder

WORKDIR /app

COPY . .

RUN npm ci

RUN npm run build

FROM nginx:1.23.3

WORKDIR /app

COPY --from=builder /app/build static

COPY ./nginx.conf /etc/nginx/nginx.conf