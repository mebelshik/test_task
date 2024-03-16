FROM nginx:latest
RUN apt-get update && \
    apt-get install -y procps && \
    rm -rf /var/lib/apt/lists/*
COPY index.html /usr/share/nginx/html/index.html
CMD ["sh", "-c", "envsubst < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"]
