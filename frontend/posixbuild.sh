#!/bin/bash
mkdir dist
# elm make src/elm/main/Main.elm --optimize --output dist/elm.js
elm make src/elm/Main.elm --output dist/elm.js

cp src/html/index.html dist/
cp wailsjs/go/main/App.js dist/
cp wailsjs/runtime/runtime.js dist/
