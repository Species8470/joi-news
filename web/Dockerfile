FROM nginx:1.22.1

WORKDIR /usr/shre/nginx/html

RUN rm -rf ./*

ADD build ./

ENTRYPOINT ["nginx", "-g", "daemon off;"]