FROM python:3.13-alpine

# 拷贝版本声明文件作为构建输入
COPY version.toml /tmp/version.toml

# 安装编译依赖 -> 从 version.toml 提取版本精准安装 -> 清理编译工具与冗余缓存
RUN apk add --no-cache --virtual .build-deps \
        gcc \
        g++ \
        musl-dev \
        m4 \
        flex \
        bison \
        git && \
    # ⭐️ 核心技巧：利用 Python 3.13 内置 tomllib 秒级解析出 "fava==1.28.0 fava-dashboards==0.3.0..."
    python3 -c '
import tomllib
with open("/tmp/version.toml", "rb") as f:
    pkgs = tomllib.load(f)["components"]
print(" ".join(f"{k}=={v}" if v else k for k, v in pkgs.items()))
' | xargs pip install --no-cache-dir && \
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