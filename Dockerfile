FROM python:3.7.1

WORKDIR /home/amadden/python/titanic-web-app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
EXPOSE 3000
ENTRYPOINT [ "python", "./app.py" ]
