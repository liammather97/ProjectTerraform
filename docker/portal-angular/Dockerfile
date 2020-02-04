FROM node:10 as build
RUN npm install -g @angular/cli@8.3.20
WORKDIR /build
COPY . .
RUN npm install
RUN ng build --prod --configuration=production

FROM nginx:alpine
COPY --from=build /build/dist/portal-core /opt/portal-core
