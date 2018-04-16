# titanic-web-app

### Run Server
```
python3 app.py
```

### Endpoint
```
http://localhost:3000/predict?&sex={SEX[m,f]}&age={AGE}&fare={FARE}
```

## Docker
```
sudo docker build -t app .
sudo docker run -it -d -p 3000:3000 --rm --name app app
```

### Classes/Prices
Based on your fare it will assume one of the following classes:
- 1st Class Fare - 3500 USD
- 2nd Class Fare - 1375 USD
- 3rd Class Fare - 500 USD
