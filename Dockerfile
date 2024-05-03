# Sử dụng phiên bản cũ của nginx có biết đến lỗ hổng bảo mật
FROM nginx:1.16.0

# Cài đặt phần mềm có lỗ hổng bảo mật
RUN apt-get update && apt-get install -y curl vulnerable-package

# Cấu hình không an toàn (ví dụ: mật khẩu mặc định)
RUN echo "admin:admin" | chpasswd

# Mở các cổng không an toàn
EXPOSE 80 443

# Thực hiện các cấu hình không an toàn khác
COPY insecure-config.conf /etc/nginx/nginx.conf
