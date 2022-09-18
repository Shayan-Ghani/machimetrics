from flask import Blueprint, Flask
from json import load as json_load
from.config import Config

def create_app(config_file=None):
    app = Flask(__name__)
    app.config.from_object(Config)
    if config_file is not None:
        app.config.from_file(config_file, load=json_load)
    return app