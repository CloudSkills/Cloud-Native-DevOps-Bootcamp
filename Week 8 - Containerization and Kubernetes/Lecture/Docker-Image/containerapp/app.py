from flask import Flask, render_template


app = Flask(__name__)

@app.route('/', methods=['GET'])

def pups():
    return "Hello CloudSkills"

if __name__ == '__main__':
    app.run()