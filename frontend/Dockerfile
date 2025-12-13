# ---------- Build stage ----------
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build


# ---------- Runtime stage ----------
FROM nginx:1.27-alpine

# non-root user
RUN addgroup -S nginxgroup && adduser -S nginxuser -G nginxgroup

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/dist /usr/share/nginx/html

# izinler
RUN chown -R nginxuser:nginxgroup /usr/share/nginx/html

USER nginxuser

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]