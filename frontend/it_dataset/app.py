from flask import Flask, request, jsonify
from flask_cors import CORS
import tensorflow as tf
import numpy as np
import json

app = Flask(__name__)
CORS(app)  # Enable CORS for frontend-backend communication

# Load pre-trained AI model (Replace with your actual model file)
try:
    model = tf.keras.models.load_model("chatbot_model.h5")
except Exception as e:
    print(f"Error loading model: {e}")
    model = None

# Load custom dataset for IT Act 2000 responses
with open("it_act_dataset.json", "r", encoding="utf-8") as f:
    intent_data = json.load(f)

# Function to find response from dataset
def get_response(message):
    message = message.lower()
    
    for intent in intent_data["intents"]:
        for pattern in intent["patterns"]:
            if pattern in message:
                return intent["response"]
    
    return "I'm sorry, I couldn't find relevant information. Please consult a lawyer for accurate guidance."

@app.route("/")
def home():
    return "IT Act 2000 Chatbot API is Running!"

@app.route("/chat", methods=["POST"])
def chat():
    data = request.get_json()
    
    if "message" not in data:
        return jsonify({"response": "Invalid request"}), 400

    user_message = data["message"]
    
    # AI model response (if applicable)
    if model:
        response = get_response(user_message)
    else:
        response = "AI model is not available. Using predefined responses."

    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
