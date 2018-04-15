FROM python:3

WORKDIR /home/amadden/python/titanic-web-app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./app.py" ]

