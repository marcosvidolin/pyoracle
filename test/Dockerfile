FROM vidolin/pyoracle:latest

COPY ./requirements.txt /opt/data
COPY ./api/server.py /opt/data/api

WORKDIR /opt/data

RUN pip install -r requirements.txt

EXPOSE 5000

CMD ["python","/opt/data/api/server.py"]
