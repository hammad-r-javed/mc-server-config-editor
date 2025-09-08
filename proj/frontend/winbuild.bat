if not exist dist mkdir dist
elm make src\main\Main.elm
move index.html dist\
