### DEVELOPMENT ###
###################

FROM node:19 as dev-stage
WORKDIR /app
COPY package*.json ./
RUN npm install -g @vue/cli@5.0.8
RUN npm install
COPY ./ .
RUN chown -R node node_modules
USER node
EXPOSE 8080
CMD [ "npm", "run", "serve"]


### PRODUCTION ###
##################

# FROM node:19 as build-stage
# WORKDIR /app
# COPY package*.json ./
# RUN npm install
# COPY . .
# RUN npm run build

# FROM nginx as production-stage
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# COPY --from=build-stage /app/dist /usr/share/nginx/html
# EXPOSE 3000
