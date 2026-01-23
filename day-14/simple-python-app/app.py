from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return 'Hello, world! deployed using AWS Code Build and Deploy with the help of AWS Pipeline'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)


# To final check of aws code build and code deploy are working or not.
