from flask import Blueprint, Flask
from flask import current_app
from json import dumps, load as json_load 
from .config import Config
from .util import now
from .util import cpu_total
from .util import memory_total
from .util import get_ip_address

index_bp = Blueprint("index_bp", import_name=__name__)
status_bp = Blueprint("status_bp", import_name=__name__)

def create_app(config_file=None):
    app = Flask(__name__)
    count = 0
    @index_bp.before_request
    def before_request():
        nonlocal count
        # to add to acctive_connections whenever index is requested
        count += 1 
    @index_bp.route("/", methods=["GET"])
    def index(): 
        return "<h1 style='text-align:center'>Welcome to our application</h1>"
    @index_bp.teardown_request
    def teardown_request(_):
        nonlocal count
        # subtract acctive_connections by one
        count -= 1 
    @status_bp.route("/status", methods=["GET"])
    def status_func(): 
        test = current_app.test_client()
        response = test.get("/")
        metrics = {
            # if status code of index is 200, it will be "up" otherwise "down"
            "status": "up" if response.status_code == 200 else "down",
            "active_connections" : count,
            "ip_address" : get_ip_address(),
            "memtotal_total" : memory_total(),
            "cpu_total" : cpu_total(),
            "current_time": now(),
        }
        metrics_json = dumps(metrics,sort_keys=False,indent=4, separators = (',\n', ': '), default=str)
        return metrics_json
    app.config.from_object(Config)
    if config_file is not None:
        app.config.from_file(config_file, load=json_load)
    app.register_blueprint(status_bp)
    app.register_blueprint(index_bp)
    
    return app