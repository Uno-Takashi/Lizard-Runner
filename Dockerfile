FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DEBCONF_NOWARNINGS yes

ADD requirement.txt /requirement.txt
RUN pip install -r requirement.txt

ADD entrypoint.py /lib/entrypoint.py
RUN chmod +x /lib/entrypoint.py

ENTRYPOINT ["python","/lib/entrypoint.py"]