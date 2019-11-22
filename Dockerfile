FROM vidolin/ubuntu-instantclient:12.1

RUN apt-get update && \
  apt-get install -y --no-install-recommends software-properties-common && \
  add-apt-repository ppa:jonathonf/python-3.6 && \
  apt-get update -y  && \
  # install all dependencies
  apt-get install -y --no-install-recommends \
  build-essential python3.6 python3.6-dev python3-pip \
  libaio-dev && \
  # remove temp files
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir -p /opt/data/api && \
  # update pip
  python3.6 -m pip install pip --upgrade && \
  python3.6 -m pip install wheel && \
  # create python link
  ln -s /usr/bin/python3 /usr/bin/python

COPY ./requirements.txt /opt/data

WORKDIR /opt/data

RUN pip install -r requirements.txt