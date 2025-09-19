import os
import sys
import subprocess
import shutil

def build_front_end():
    root_dir = os.getcwd()
    os.chdir('frontend')

    if os.name == "nt":
        subprocess.run(['winbuild.bat'])
    if os.name == "posix":
        subprocess.run(['./posixbuild.sh'])
    
    os.chdir(root_dir)

def build_app(command):
    subprocess.run(command)
    exit()

build_front_end()

if len(sys.argv) == 1:
    build_app(['wails', 'build'])

if sys.argv[1] == 'dev':
    build_app(['wails', 'build', '--devtools'])

print(f'Invalid CLI param provided -> {sys.argv[1]}')
