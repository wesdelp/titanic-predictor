<!DOCTYPE html>
<html lang="en-US">
  <head>
    <title>Titanic</title>
    <meta charset="utf-8"/>
    <style>
    @import url("https://fonts.googleapis.com/css?family=Unica+One");
    /*Colors*/
    /*Gradients and Fills */
    .sky-bright {
      stop-color: #d1f3fa;
    }

    .sky-dark {
      stop-color: #70b4c2;
    }

    .beam-gradient {
      stop-color: #e9fef6;
    }

    .ocean-surface {
      fill: #ade0eb;
    }

    .ocean-shallow {
      stop-color: #9fc2ca;
    }

    .ocean-deep {
      stop-color: #306b98;
    }

    .ice {
      fill: #f6f6ff;
    }

    .ice-dark {
      fill: #d7eef2;
    }

    .ice-shade {
      fill: #e8f7f9;
    }

    /*Light Beams*/
    @-webkit-keyframes beams {
      100% {
        opacity: 0.8;
      }
    }
    @keyframes beams {
      100% {
        opacity: 0.8;
      }
    }
    .beam {
      opacity: 0;
      -webkit-animation: beams 4s both infinite alternate;
              animation: beams 4s both infinite alternate;
    }
    .beam:nth-child(1) {
      -webkit-animation-delay: -2s;
              animation-delay: -2s;
    }
    .beam:nth-child(2) {
      -webkit-animation-delay: -4s;
              animation-delay: -4s;
    }
    .beam:nth-child(3) {
      -webkit-animation-delay: -6s;
              animation-delay: -6s;
    }
    .beam:nth-child(4) {
      -webkit-animation-delay: -8s;
              animation-delay: -8s;
    }
    .beam:nth-child(5) {
      -webkit-animation-delay: -10s;
              animation-delay: -10s;
    }
    .beam:nth-child(6) {
      -webkit-animation-delay: -12s;
              animation-delay: -12s;
    }
    .beam:nth-child(7) {
      -webkit-animation-delay: -14s;
              animation-delay: -14s;
    }
    .beam:nth-child(8) {
      -webkit-animation-delay: -16s;
              animation-delay: -16s;
    }
    .beam:nth-child(9) {
      -webkit-animation-delay: -18s;
              animation-delay: -18s;
    }
    .beam:nth-child(10) {
      -webkit-animation-delay: -20s;
              animation-delay: -20s;
    }
    .beam:nth-child(11) {
      -webkit-animation-delay: -22s;
              animation-delay: -22s;
    }
    .beam:nth-child(12) {
      -webkit-animation-delay: -24s;
              animation-delay: -24s;
    }
    .beam:nth-child(13) {
      -webkit-animation-delay: -26s;
              animation-delay: -26s;
    }
    .beam:nth-child(14) {
      -webkit-animation-delay: -28s;
              animation-delay: -28s;
    }

    /*Waves-Movements*/
    .wave {
      -webkit-animation: waves-move 5s infinite linear;
              animation: waves-move 5s infinite linear;
      -webkit-animation-fill-mode: backwards;
              animation-fill-mode: backwards;
    }

    .reverse {
      animation-direction: reverse;
    }

    @-webkit-keyframes waves-move {
      100% {
        -webkit-transform: translate(500px, 0);
                transform: translate(500px, 0);
      }
    }

    @keyframes waves-move {
      100% {
        -webkit-transform: translate(500px, 0);
                transform: translate(500px, 0);
      }
    }
    /*Ice Berg Animation*/
    .ice-berg {
      -webkit-transform: rotate(-2deg) translate(0, 0);
              transform: rotate(-2deg) translate(0, 0);
      -webkit-transform-origin: 400px 400px;
              transform-origin: 400px 400px;
      -webkit-animation: ice-berg 3s ease-in-out infinite alternate;
              animation: ice-berg 3s ease-in-out infinite alternate;
    }

    @-webkit-keyframes ice-berg {
      100% {
        -webkit-transform: rotate(2deg) translate(10px, 30px);
                transform: rotate(2deg) translate(10px, 30px);
      }
    }

    @keyframes ice-berg {
      100% {
        -webkit-transform: rotate(2deg) translate(10px, 30px);
                transform: rotate(2deg) translate(10px, 30px);
      }
    }
    /*Body Setup*/
    body {
      background: #f2ead9;
      display: flex;
      flex-direction: column;
      align-items: center;
      font-family: 'Unica One';
    }

    .title {
      min-height: 10vh;
      line-height: 10vh;
      font-size: 8vh;
      padding: 2.5vh;
      margin: 0;
      color: #6b572e;
      border-top: 1px solid;
      border-bottom: 1px solid;
      font-family: 'Unica One', cursive;
    }

    .world {
      width: 50vw;
      height: 40vh;
      vertical-align: top;
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
      min-width: 30vw;
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
    %if params['fare'] == 0:
      %form_name = 'Your Info'
      <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1000 1000" class="world">
        <defs>
          <linearGradient id="beam-mask-gradient" x1="170" y1="503.73" x2="170" y2="2.29" gradientUnits="userSpaceOnUse">
            <stop offset="0"/>
            <stop offset="1" stop-color="#fff"/>
          </linearGradient>
          <mask id="beam-mask" x="-50" y="-0.27" width="440" height="508" maskUnits="userSpaceOnUse">
            <rect fill="url(#beam-mask-gradient)" x="-50" width="440" height="508"/>
          </mask>
          <linearGradient id="beam-gradient" x1="123.73" y1="240.19" x2="187.2" y2="267.39" gradientUnits="userSpaceOnUse">
            <stop offset="0" class="beam-gradient" stop-opacity="0.5"/>
            <stop offset="1" class="beam-gradient" stop-opacity="0.1"/>
          </linearGradient>
          <symbol id="beam" data-name="beam" viewBox="0 0 306 505">
            <polygon mask="url(#beam-mask)" fill="url(#beam-gradient)" points="79 505 0 505 227 0 306 0 79 505"/>
          </symbol>
          <linearGradient id="sky-gradient" x1="500" y1="123.81" x2="500" y2="410.73" gradientUnits="userSpaceOnUse">
            <stop offset="0" class="sky-dark"/>
            <stop offset="1" class="sky-bright" />
          </linearGradient>
          <linearGradient id="ocean-gradient" x1="499.5" y1="999.5" x2="499.5" y2="499.5" gradientUnits="userSpaceOnUse">
            <stop offset="0" class="ocean-deep" stop-color="#306b98"/>
            <stop offset="0.85" class="ocean-shallow" stop-color="#9fc2ca"/>
          </linearGradient>
          <clipPath id="world">
              <circle id="clipPath" cx="500" cy="500" r="450"/>
          </clipPath>
          <clipPath id="waves">
            <path class="wave" d="M1502,950H-500V632c115-3,147-58,250-58s145,58,250,58,147-58,250-58,145,58,250,58,147-58,250-58,145,58,250,58,147-58,250-58,145,58,250,58C1500,780,1502,950,1502,950Z"/>
          </clipPath>
          <clipPath id="icebergClip">
              <path class="wave reverse" class="cls-2" d="M-399,0H1603V504c-115,3-147,58-250,58s-145-58-250-58-147,58-250,58-145-58-250-58-147,58-250,58-145-58-250-58-147,58-250,58-145-58-250-58C-397,356-399,0-399,0Z"/>
          </clipPath>
        </defs>
        <g clip-path="url(#world)">
          <rect fill="url(#sky-gradient)" width="1000" height="500"/>
          <rect class="ocean-surface" x="-1" y="445" width="1000" height="554"/>
          <g clip-path="url(#icebergClip)">
            <g id="iceBerg" class="ice-berg">
              <path class="ice" d="M514 504L387 837l-5 14-66-110-25 3-100-282-2-4 2-2 2-3 114-203 18 50 26 17 47-73 47 84 23 83 41 55h5v38z"/>
              <path class="ice-shade" d="M372 803c-5-37-10-72-6-109s-17-59-28-87c-3-8 2-19-2-25-13-21-33-29-50-46-1-2-6 0-8-1-14-11-20-26-36-36s-3-13-4-21-4-4-8-7-2-4-3-4-23-9-34-14l-2 3-2 3v4l102 281 25-3 66 110 5-14c-3-12-13-22-15-34z"/>
              <path class="ice-dark" d="M399 244l-47 66 8 35 39-101zm-90 6l-28 82-27 12 55-94zm-17 495L189 463l4-10 99 292zm92 106l-92-149 46 44 46 105z"/>
            </g>
          </g>
          <g clip-path="url(#waves)">
            <rect fill="url(#ocean-gradient)" x="-1" y="500" width="1000" height="500"/>
            <use xlink:href="#iceBerg" opacity="0.1" />
            <use class="beam" width="306" height="505.47" transform="translate(217 485)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(329 515) scale(0.74)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(410 515) scale(0.58)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(489 477) scale(0.74)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(641 515) scale(0.74)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(542 485) scale(0.93)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(478 485) scale(0.93)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(74 485) scale(0.93)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(299 525) scale(0.46)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(777 525) scale(0.46)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(-50 485) scale(0.84)" xlink:href="#beam"/>
            <use class="beam" width="306" height="505.47" transform="translate(93 500) scale(0.57)" xlink:href="#beam"/>
          </g>
        </g>
      </svg>
    %else:
      %form_name = 'Try Again?'
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
    %end
    <form id='predict-form' action="http://localhost:3000/predict" action="get">
    <header><legend>{{form_name}}</legend></header>
      <fieldset>
        <div class="block">
          <label for="age">Age</label>
          <input id="age" name="age" type="number" value="{{params['age']}}">

          <label for="fare">Ticket Price ($)</label>
          <input id="fare" name="fare" type="number" value="{{params['fare']}}">
        </div>

        <label for="sex">Gender</label>
        <div class="inline">
          %if params['sex'] == 'm':
            <input type="radio" id="male" name="sex" value="m" checked>
          %else:
            <input type="radio" id="male" name="sex" value="m">
          %end
          <label for="male">Male</label>

          %if params['sex'] == 'f':
            <input type="radio" id="female" name="sex" value="f" checked>
          %else:
            <input type="radio" id="female" name="sex" value="f">
          %end
          <label for="female">Female</label>
        </div>
      </fieldset>
      <button id="predict-submit" type="submit">Predict!</button>
    </form>
  </body>
</html>
