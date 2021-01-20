from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world(event, context):
 return '<h1>Hello CloudSkills Bootcamp!!</h1>'

# Only for local dev environments
if __name__ == '__main__':
 app.run()