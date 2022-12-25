FROM nginx:1.22.1

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

ADD web/build ./

ENTRYPOINT ["nginx", "-g", "daemon off;"]