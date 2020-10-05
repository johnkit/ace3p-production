"""Test spec compiler.

Simply loads all .yml files in "tests" directory and writes equivalent
json files to "public/data".
"""

import json
print(dir(json))
import os

import yaml


if __name__ == "__main__":
    source_dir = os.path.abspath(os.path.dirname(__file__))
    yml_dir = os.path.join(source_dir, 'tests')
    json_dir = os.path.join(source_dir, 'public', 'data')

    for yml_file in os.listdir(yml_dir):
        base, ext = os.path.splitext(yml_file)
        if ext in ['.yml', '.yaml']:
            js = None
            yml_path = os.path.join(yml_dir, yml_file)
            with open(yml_path) as fyml:
                print('Reading {}'.format(yml_path))
                yml = yaml.load(fyml)
                js = json.dumps(yml, indent=2)
            if not js:
                continue
            json_file = '{}.json'.format(base)
            json_path = os.path.join(json_dir, json_file)
            with open(json_path, 'w') as fjs:
                print('Writing {}'.format(json_path))
                fjs.write(js)
                fjs.write('\n')
