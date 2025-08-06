import json
import numpy as np
import pandas as pd
import nltk
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Dropout
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.preprocessing import LabelEncoder
import pickle

# Load dataset
with open("it_act_dataset.json", "r") as file:
    data = json.load(file)

questions = [item["question"] for item in data]
answers = [item["answer"] for item in data]

# Convert text to numerical data using TF-IDF
vectorizer = TfidfVectorizer()
X = vectorizer.fit_transform(questions).toarray()

# Encode labels
encoder = LabelEncoder()
y = encoder.fit_transform(answers)

# Build Neural Network Model
model = Sequential([
    Dense(128, activation="relu", input_shape=(X.shape[1],)),
    Dropout(0.5),
    Dense(64, activation="relu"),
    Dropout(0.3),
    Dense(len(set(y)), activation="softmax")
])

model.compile(loss="sparse_categorical_crossentropy", optimizer="adam", metrics=["accuracy"])

# Train the model
model.fit(X, y, epochs=100, batch_size=8, verbose=1)

# Save model and vectorizer
model.save("chatbot_model.h5")
pickle.dump(vectorizer, open("vectorizer.pkl", "wb"))
pickle.dump(encoder, open("encoder.pkl", "wb"))

print("Model trained and saved!")
