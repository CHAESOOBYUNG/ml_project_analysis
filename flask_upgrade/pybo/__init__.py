from flask import Flask
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

import config
db=SQLAlchemy()
migrate=Migrate()

def create_app():
    app=Flask(__name__)
    CORS(app)
    app.config.from_object(config)

    #ORM Initialization
    db.init_app(app)
    migrate.init_app(app,db)
    from . import models

    #Blueprint
    from .views import main_views, question_views, answer_views, auth_views
    app.register_blueprint(main_views.bp)
    app.register_blueprint(question_views.bp)
    app.register_blueprint(answer_views.bp)
    app.register_blueprint(auth_views.bp)
    return app