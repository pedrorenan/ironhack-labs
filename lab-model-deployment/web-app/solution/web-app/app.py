import numpy as np
from flask import Flask, request, render_template
import pickle

app = Flask(__name__)

model_pedro = pickle.load(open("ufo-model-pedro.pkl", "rb"))


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/predict", methods=["POST"])
def predict():

    int_features = [int(x) for x in request.form.values()]
    final_features = [np.array(int_features)]
    prediction_pedro = model_pedro.predict(final_features)
    print("prediction_pedro", prediction_pedro)

    output_pedro = prediction_pedro[0]

    shapes = ['cylinder', 'light', 'circle', 'sphere', 'disk', 'fireball',
       'unknown', 'oval', 'other', 'cigar', 'rectangle', 'chevron',
       'triangle', 'formation', 'nan', 'delta', 'changing', 'egg',
       'diamond', 'flash', 'teardrop', 'cone', 'cross', 'pyramid',
       'round', 'crescent', 'flare', 'hexagon', 'dome', 'changed']

    return render_template(
        "index.html", prediction_text="Likely shape: {}".format(shapes[output_pedro])
    )


if __name__ == "__main__":
    app.run(debug=True)
