from flask import Blueprint, url_for, render_template
from werkzeug.utils import redirect

bp = Blueprint('main',__name__, url_prefix='/')

@bp.route('/hello')
def hello_pybo():
    return 'Hello, Pybo!'

@bp.route('/question')
def index():
    return redirect(url_for('question._list'))

@bp.route("/")
def home():
    return render_template("main.html")  # templates/main.html을 렌더링