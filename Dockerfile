FROM python:3.10

ADD pyproject.toml /pyproject.toml
RUN pip install poetry

RUN poetry install --no-root

ADD entrypoint.py /lib/entrypoint.py
RUN chmod +x /lib/entrypoint.py

ENTRYPOINT ["poetry","run","python","/lib/entrypoint.py"]