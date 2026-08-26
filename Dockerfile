FROM python:3.13-alpine

# 安装编译依赖 -> 安装 Fava 及所有主流扩展库 -> 立即清除编译缓存与临时包
RUN apk add --no-cache --virtual .build-deps gcc musl-dev git && \
    pip install --no-cache-dir \
        fava \
        fava-dashboards \
        fava-envelope \
        fava-portfolio-returns \
        beancount-reds-plugins && \
    apk del .build-deps

WORKDIR /app
EXPOSE 5000

ENV FAVA_HOST="0.0.0.0"
ENV FAVA_PORT="5000"
ENV BEANCOUNT_FILE="/app/main.bean"

CMD ["sh", "-c", "fava --prefix \"${FAVA_PREFIX}\" \"${BEANCOUNT_FILE}\""]