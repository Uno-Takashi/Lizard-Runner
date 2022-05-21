FROM python:3.10

ADD requirement.txt /requirement.txt
RUN pip install -r requirement.txt

ADD entrypoint.py /lib/entrypoint.py
RUN chmod +x /entrypoint.py

ENTRYPOINT ["python","/lib/entrypoint.py"]