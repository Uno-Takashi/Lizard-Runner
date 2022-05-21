FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBCONF_NOWARNINGS yes

ADD pyproject.toml /pyproject.toml
RUN pip install poetry

RUN poetry install --no-root

ADD entrypoint.py /lib/entrypoint.py
RUN chmod +x /lib/entrypoint.py

ENTRYPOINT ["poetry","run","python","/lib/entrypoint.py"]