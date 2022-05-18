FROM python:3.10

ADD requirement.txt /requirement.txt
RUN pip install -r requirement.txt

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]