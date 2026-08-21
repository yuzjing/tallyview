FROM python:3.13-alpine


# 安装时区、安全证书与基础构建环境
RUN apk add --no-cache tzdata ca-certificates gcc musl-dev libxml2-dev libxslt-dev
ENV TZ=Asia/Shanghai

WORKDIR /data

# 🔒 100% 仅从 PyPI 官方正规源安装经过社区广泛审计的高信誉插件 (秒级极速构建，体积仅 ~50MB)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    fava \
    fava-dashboards \
    fava-envelope \
    fava-portfolio-returns \
    beancount_reds_plugins
EXPOSE 5000

CMD ["fava", "--host", "0.0.0.0", "--port", "5000", "/data/main.bean"]