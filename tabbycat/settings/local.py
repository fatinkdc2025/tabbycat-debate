from .base import * import dj_database_url import os

DEBUG = True
ALLOWED_HOSTS = []

DATABASES = {
    'default': dj_database_url.parse(
        os.getenv('DATABASE_URL', 'postgres://tabbycat:tabbycat@localhost:5432/tabbycatdb')
    )
}

SECRET_KEY = os.getenv('SECRET_KEY', 'dev-secret-key')
# local settings for production override
