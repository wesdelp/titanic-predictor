<!DOCTYPE html>
<html lang="en-US">
  <head>
    <title>Titanic</title>
    <meta charset="utf-8"/>
    <style>
      @import url("https://fonts.googleapis.com/css?family=Unica+One");
      body {
        background: #f2ead9;
        display: flex;
        flex-direction: column;
        align-items: center;
        font-family: 'Unica One';
      }

      .title {
        height: 10vh;
        line-height: 10vh;
        font-size: 8vh;
        padding: 2.5vh;
        margin: 0;
        color: #6b572e;
        border-top: 1px solid;
        border-bottom: 1px solid;
        font-family: 'Unica One', cursive;
      }

      .item {
        flex: 1;
      }

      .block {
        display: block;
      }

      .inline {
        display: inline;
      }

      label {
        margin-top: 5px;
        display: inherit;
      }

      input {
        display: inherit;
      }

      form {
        font-size: 30px;
        margin: 20px auto 0 auto;
        width: 30vw;
        background-color: white;
        box-shadow: 0px 10px 9px rgba(0,0,0,0.6);
      }

      header {
        width: 100%;
        background-color: #363D45;
        color: #ffffff;
      }

      legend {
        padding-left: 5px;
      }

      fieldset {
        border: 0;
      }

      button {
        margin: 0 10px 10px 10px;
        font: inherit;
        border: 0;
        background-color: green;
        color: white;
      }
    </style>
  </head>
  <body>
    <div class="title">
      Titanic Survival Predictor
    </div>
    %if result < 33.33:
    <h1>Doesn't look good for you. {{result}}% chance of survival. :(</h1>
    <img src="https://media.giphy.com/media/OJw4CDbtu0jde/giphy.gif"></img>
    %elif result < 66.66:
      <h1>You might survive? {{result}}% chance of survival. :/</h1>
      <img src="https://media.giphy.com/media/UsvHd1UncQq3u/giphy.gif"></img>
    %else:
      <h1>Looking good! {{result}}% chance of survival! :)</h1>
      <img src="https://media.giphy.com/media/3o6EhZHDSQe9Bi4LYs/giphy.gif"></img>
    %end
    <form id='predict-form' action="http://localhost:3000/predict" action="get">
      <header><legend>Try Again?</legend></header>
      <fieldset>
        <div class="block">
          <label for="age">Age</label>
          <input id="age" name="age" type="number">

          <label for="fare">Ticket Price ($)</label>
          <input id="fare" name="fare" type="number">
        </div>

        <label for="sex">Gender</label>
        <div class="inline">
          <input type="radio" id="male" name="sex" value="m">
          <label for="male">Male</label>

          <input type="radio" id="female" name="sex" value="f">
          <label for="female">Female</label>
        </div>
      </fieldset>
      <button id="predict-submit" type="submit">Predict!</button>
    </form>
  </body>
</html>
