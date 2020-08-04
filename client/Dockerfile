# Build step
FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

# Run step
FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=0 /app/build /usr/share/nginx/html
 #Erklärung für --from=0 - 0 steht für den ersten Step. Hier Build.