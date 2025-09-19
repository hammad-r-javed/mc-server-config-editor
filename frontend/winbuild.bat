if not exist dist mkdir dist
elm make src\elm\main\Main.elm
move index.html dist\
