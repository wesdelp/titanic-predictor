# titanic-web-app

### Run Server
```
python3 app.py
```

### Endpoint
```
http://localhost:8080/predict?&sex={SEX[m,f]}&age={AGE}&fare={FARE}
```

### Classes/Prices
Based on your fare it will assume one of the following classes:
- 1st Class Fare - 3500 USD
- 2nd Class Fare - 1375 USD
- 3rd Class Fare - 500 USD
