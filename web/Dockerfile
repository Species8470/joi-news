FROM nginx:1.22.1
ADD build /usr/share/nginx/html

ENV REACT_APP_API_BASE_URL = ${REACT_APP_API_BASE_URL}

ENTRYPOINT ["nginx", "-g", "daemon off;"]