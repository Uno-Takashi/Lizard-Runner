FROM python:3.10

RUN pip install poetry
ADD pyproject.toml /pyproject.toml
RUN pip install lizard

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]