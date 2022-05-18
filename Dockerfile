FROM python:3.10

RUN pip install poetry
ADD pyproject.toml /pyproject.toml
RUN poetry install --no-root

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]