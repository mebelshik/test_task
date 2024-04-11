FROM nginx:latest
RUN if command -v apt-get > /dev/null; then apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*; elif command -v yum > /dev/null; then yum -y update && yum -y install procps && yum clean all; fi
COPY index.html.template /usr/share/nginx/html/index.html.template
CMD /bin/bash -c "CPU_CORES=\$(nproc) && \
MEMORY=\$(free -m | awk '/^Mem:/{print \$2}')M && \
DISK_SPACE=\$(df -h / | awk 'NR==2 {print \$4}') && \
envsubst < /usr/share/nginx/html/index.html.template > /usr/share/nginx/html/index.html && \
nginx -g 'daemon off;'"
