FROM nginx:latest
RUN apt-get update && \
    apt-get install -y procps && \
    rm -rf /var/lib/apt/lists/*
COPY index.html.template /usr/share/nginx/html/index.html.template
CMD /bin/bash -c "CPU_CORES=`nproc` && \
                  MEMORY=`free -m | awk '/^Mem:/{print $$2}'`M && \
                  DISK_SPACE=`df -h / | awk 'NR==2 {print $$4}'` && \
                  envsubst < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html && \
                  nginx -g 'daemon off;'"
