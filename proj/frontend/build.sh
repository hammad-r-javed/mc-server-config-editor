#!/bin/bash
mkdir dist
elm make src/main/Main.elm
mv index.html dist/
