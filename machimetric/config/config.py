from os import environ

class Config:
    ENV = environ.get("MACHIMETRIC_API_ENV", "production")
    DEBUG = bool(int(environ.get("MACHIMETRIC_API_DEBUG", "0")))
    TESTING = DEBUG