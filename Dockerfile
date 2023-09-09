# node.js v14
FROM node:14.5.0-alpine

# working directory
WORKDIR /app

# menyalin seluruh source code ke working directory
COPY . /app

# menentukan bahwa aplikasi berjalan dalam production mode dan menggunakan container 'item-db' sebagai database host
ENV NODE_ENV=production
ENV DB_HOST=item-db

# menginstall dependencies untuk production
RUN npm install --production --unsafe-perm && npm run build

# mengekspos port yang digunakan
EXPOSE 8080

# jalankan server dengan perintah npm start
CMD ["npm", "start"]
