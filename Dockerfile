FROM python:3.13-alpine


RUN apk add --no-cache tzdata ca-certificates gcc musl-dev libxml2-dev libxslt-dev git
ENV TZ=Asia/Shanghai

WORKDIR /data


RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir \
    fava \
    fava-dashboards \
    fava-portfolio-returns \
    fava-investor \
    fava-envelope \
    beancount-plugins \
    beancount-share \
    beancount_reds_plugins \
    git+https://github.com/Evernight/fava-currency-tracker.git \
    git+https://github.com/tarioch/beancount_lazy_plugins.git

EXPOSE 5000

CMD ["fava", "--host", "0.0.0.0", "--port", "5000", "/data/main.bean"]