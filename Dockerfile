FROM nginx:latest
RUN apt-get update && apt-get install -y procps
COPY index.html /usr/share/nginx/html/index.html
CMD /bin/bash -c "echo -e \"<h1>System Information</h1><p>CPU Cores: \$(nproc)</p><p>Memory: \$(free -m | awk '/^Mem:/{print \$2}')MB</p><p>Disk Space: \$(df -h / | awk 'NR==2 {print \$4}')</p>\" > /usr/share/nginx/html/index.html && nginx -g 'daemon off;'"
