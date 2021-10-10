from flask import Flask, json
from prometheus_client import start_http_server, Summary

# Create a metric to track time spent and requests made.
REQUEST_TIME = Summary('request_processing_seconds', 'Time spent processing request')

companies = [{"id": 1, "name": "Company One"}, {"id": 2, "name": "Company Two"}]

api = Flask(__name__)

@REQUEST_TIME.time()
@api.route('/companies', methods=['GET'])
def get_companies():
  return json.dumps(companies)

if __name__ == '__main__':
    # Start up the server to expose the metrics.
    start_http_server(8000)
    api.run(host="0.0.0.0") 
    # Generate some requests.
    while True:
        process_request(random.random())
