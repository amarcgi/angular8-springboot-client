FROM node:11.6.0-alpine AS builder
WORKDIR /employee-client
COPY . ./employee-client
RUN npm i
RUN npm run build --prod
RUN npm install caniuse-lite browserslist
RUN npm uninstall caniuse-lite browserslist

FROM nginx:1.15.8-alpine
COPY --from=builder /employee-client/dist/employee-client/ /usr/share/nginx/html