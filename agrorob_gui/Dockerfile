FROM ubuntu:22.04
WORKDIR /app
RUN apt update && apt install -y python3 python3-pip git
RUN git clone https://github.com/icos-pit/agrorob_server.git 
# COPY requirements.txt /app
RUN pip install -r agrorob_server/requirements.txt
ENTRYPOINT ["python3","agrorob_server/manage.py","runserver"]
