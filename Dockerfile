FROM python:3.13-alpine

# 安装编译依赖 -> 安装扩展 -> 清理编译工具 -> 清理 Python 冗余测试用例与缓存
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        g++ \
        musl-dev \
        m4 \
        flex \
        bison \
        git && \
    pip install --no-cache-dir \
        fava \
        fava-dashboards \
        fava-envelope \
        fava-portfolio-returns \
        beancount-reds-plugins && \
    apk del .build-deps && \
    # ⭐️ 极致压榨：清理无用的 Python 测试包、文档与编译缓存
    find /usr/local/lib/python3.13 -type d -name "tests" -exec rm -rf {} + 2>/dev/null || true && \
    find /usr/local/lib/python3.13 -type d -name "test" -exec rm -rf {} + 2>/dev/null || true && \
    find /usr/local/lib/python3.13 -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true && \
    rm -rf /root/.cache /tmp/*

WORKDIR /app
EXPOSE 5000

ENV FAVA_HOST="0.0.0.0"
ENV FAVA_PORT="5000"
ENV BEANCOUNT_FILE="/app/main.bean"

CMD ["sh", "-c", "fava --prefix \"${FAVA_PREFIX}\" \"${BEANCOUNT_FILE}\""]