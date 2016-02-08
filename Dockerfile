FROM debian:jessie

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
 git build-essential python2.7-dev python-pip libffi-dev libssl-dev

RUN pip install --upgrade pip

RUN mkdir /webapp

COPY requirements.txt /
RUN pip install -r /requirements.txt

COPY . /webapp/

WORKDIR /webapp

EXPOSE 8001 5000

ENTRYPOINT ["/bin/bash"]