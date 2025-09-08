import os
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

def build_app():
    subprocess.run(['wails', 'build'])

build_front_end()
build_app()
