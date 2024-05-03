FROM nginx:latest

# Cài đặt một gói dễ bị tấn công
RUN apt-get update && apt-get install -y libxml2-dev

# Sao chép một tệp cấu hình không an toàn
COPY insecure-config.conf /etc/nginx/conf.d/default.conf

# Chạy nginx với quyền root
USER root

CMD ["nginx", "-g", "daemon off;"]
