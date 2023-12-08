FROM python:3.12
WORKDIR /app
COPY show.html /app/show.html
RUN pip install -r requirements.txt