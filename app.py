from bottle import redirect, request, response, run, get, template
from sklearn import preprocessing
from collections import OrderedDict
import pandas as pd
import pickle
import json
import copy

@get('/')
def home():
    redirect("/predict")

@get('/_ping')
def ping():
    response.headers['Content-Type'] = 'application/json'
    return json.dumps({'ok': 'true'})

@get('/predict')
def predict():
    data = request.query.decode()
    params = prepareParams(data)
    preparedData = prepareData(params)
    clf = loadModel()
    result = predictProbability(preparedData, clf)

    return template('prediction', result=result, params=params)

def loadModel():
    model = open('titanic_model.sav', 'rb')
    clf = pickle.load(model)
    model.close()
    return clf

def prepareParams(data):
    p_fare = data.get('fare', 0)
    p_sex = data.get('sex', 'm')
    p_age = data.get('age', 0)
    dict = OrderedDict({
        'pclass': pclass(p_fare),
        'sex': p_sex,
        'age': int(p_age),
        'sibsp': 0,
        'parch': 0,
        'fare': int(p_fare),
        'embarked': 'C'
    })
    return dict

def prepareData(data):
    prep_data = copy.deepcopy(data)
    prep_data['fare'] = fare(prep_data['fare'])
    df = pd.DataFrame([prep_data])
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

run(host='0.0.0.0', port=3000, debug=True, reloader=True)
