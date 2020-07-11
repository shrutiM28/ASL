FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update
RUN apt-get install -y libgtk2.0-dev
RUN pip install opencv-python
COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt


COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
