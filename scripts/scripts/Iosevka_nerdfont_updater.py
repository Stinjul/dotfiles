#!/usr/bin/python

import os
import argparse
from shutil import copyfile

cwd = os.getcwd()

def update_files(src_dir: str):
    for dir in next(os.walk(cwd))[1]:
        srcfilename = f'iosevka-fixed-{dir.replace("-","").lower()}.ttf'
        filename = f'iosevka-term-{dir.replace("-","").lower()}.ttf'
        src = f'{src_dir}{srcfilename}'
        dst = f'{cwd}/{dir}/{filename}'
        copyfile(src, dst)



parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('--src_dir', type=str, required=True, help='Source of new ttf\'s')

args = parser.parse_args()
update_files(args.src_dir)
