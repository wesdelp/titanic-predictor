from bottle import request, response, route, run, get
import pickle
import json
from sklearn import datasets, preprocessing
import sklearn.ensemble as ske
import pandas as pd
from collections import OrderedDict
from datetime import date

@route('/')
def app():
    return "Hello World!"

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
    df = pd.DataFrame([{
        'pclass': data['pclass'],
        'sex': data['sex'],
        'age': data['age'],
        'sibsp': data['sibsp'],
        'parch': data['parch'],
        'fare': data['fare'],
        'embarked': data['embarked']
    }])

    preparedDf = preprocessDf(df)
    return preparedDf

def preprocessDf(df):
    processed_df = df.copy()
    le = preprocessing.LabelEncoder()
    processed_df.sex = le.fit_transform(processed_df.sex)
    processed_df.embarked = le.fit_transform(processed_df.embarked)
    return processed_df.values

run(host='localhost', port=8080, debug=True)
