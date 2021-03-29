FROM python:latest

RUN mkdir /build
WORKDIR /build

COPY containerapp/ /build

COPY containerapp/requirements.txt /build

RUN pip install -r requirements.txt

CMD ["python", "app.py"]