from bottle import request, response, route, run, get
import pickle
import json
from sklearn import datasets, preprocessing
import sklearn.ensemble as ske
import pandas as pd
from collections import OrderedDict
from datetime import date

@get('/predict')
def predict():
    data = request.query.decode()
    preparedData = prepareData(data)
    print(preparedData)
    # clf = load_model()
    # clf.predict()
    response.headers['Content-Type'] = 'application/json'
    return json.dumps({'prediction': 82})

def loadModel():
    return
    # model = open('file', 'r')
    # clf = pickle.loads(model)
    # model.close()
    # return clf

def prepareData(data):
    dict = OrderedDict({
        'pclass': int(data['pclass']),
        'sex': data['sex'],
        'age': int(data['age']),
        'sibsp': 0,
        'parch': 0,
        'fare': fare(data['fare']),
        'embarked': 'C'
    })

    df = pd.DataFrame([dict])
    preparedDf = preprocessDf(df)
    return preparedDf

def preprocessDf(df):
    processed_df = df.copy()
    le = preprocessing.LabelEncoder()
    processed_df.sex = le.fit_transform(processed_df.sex)
    processed_df.embarked = le.fit_transform(processed_df.embarked)
    return processed_df.values

def fare(currentPrice):
    INFLATION_MULTIPLIER = 23.45
    originalPrice = float(currentPrice) / INFLATION_MULTIPLIER
    return round(originalPrice, 2)

run(host='localhost', port=8080, debug=True, reloader=True)
