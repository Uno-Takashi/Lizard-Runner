FROM python:3.10

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# 環境変数を設定
ENV PYTHONPATH /usr/src/app
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBCONF_NOWARNINGS yes

RUN pip install poetry
ADD pyproject.toml /usr/src/app
RUN poetry install --no-root

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]