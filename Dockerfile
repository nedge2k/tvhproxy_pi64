FROM arm64v8/debian:bullseye-slim

RUN apt-get update && apt-get install -y \
    git \
    python3.9-minimal \
    python3-pip \
    nano \
 && rm -rf /var/lib/apt/lists/*

RUN pip install flask requests gevent

WORKDIR tmp
RUN git clone https://github.com/jkaberg/tvhProxy.git
RUN chmod +x /tmp/tvhProxy/tvhProxy.py
WORKDIR tvhProxy
CMD python3.9 tvhProxy.py
