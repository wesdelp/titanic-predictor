from bottle import request, response, run, get, template
from sklearn import preprocessing
from collections import OrderedDict
import pandas as pd
import pickle
import json

@get('/predict')
def predict():
    data = request.query.decode()
    preparedData = prepareData(data)
    clf = loadModel()
    result = predictProbability(preparedData, clf)

    return template('prediction', result=result)

def loadModel():
    model = open('titanic_model.sav', 'rb')
    clf = pickle.load(model)
    model.close()
    return clf

def prepareData(data):
    dict = OrderedDict({
        'pclass': pclass(data['fare']),
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
    le = preprocessing.LabelEncoder().fit(['m', 'f'])
    processed_df.sex = le.transform(processed_df.sex)
    processed_df.embarked = le.fit_transform(processed_df.embarked)
    return processed_df.values

def predictProbability(data, model):
    probability = model.predict_proba(data)
    return round(probability[0][1]*100, 2)

def fare(currentPrice):
    INFLATION_MULTIPLIER = 23.45
    originalPrice = float(currentPrice) / INFLATION_MULTIPLIER
    return round(originalPrice, 2)

def pclass(fare):
    fare = int(fare)
    if fare < 500:
        return 3
    elif fare < 1375:
        return 2
    else:
        return 1

run(host='localhost', port=8080, debug=True, reloader=True)
