FROM python:3.10

ADD requirement.txt /requirement.txt
RUN pip install -r requirement.txt

ADD lizard_argument_validator.py /lib/lizard_argument_validator.py

ADD entrypoint.py /entrypoint.py
RUN chmod +x /entrypoint.py

ENTRYPOINT ["python","/entrypoint.py"]