if not exist dist mkdir dist

elm make src/elm/Main.elm --output dist/elm.js

cp src/html/index.html dist/
