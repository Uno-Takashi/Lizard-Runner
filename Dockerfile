FROM python:3.10

ADD requirement.txt /requirement.txt
RUN pip install -r requirement.txt

ADD lizard_argument_validator.py /src/lizard_argument_validator.py

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]