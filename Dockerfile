# Dockerfile
FROM ubuntu
FROM nginx

# Maintainer info
LABEL MAINTAINER Hans Yen <Hans@smartfun.com.tw>

# 透過 apt-get 更新
RUN apt-get update -y

# 透過 apt-get 安裝 python-pip, build-essential
RUN apt-get install -y python3-pip build-essential unixodbc-dev git docker.io
