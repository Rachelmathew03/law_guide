import flask
from flask import Flask, request, jsonify, Response
from flask_cors import CORS
from langchain_community.vectorstores import FAISS
from langchain_huggingface import HuggingFaceEmbeddings
from rapidfuzz import process, fuzz
import json
import os
import re

os.environ["TF_ENABLE_ONEDNN_OPTS"] = "0"

app = Flask(__name__)
CORS(app)

with open("it_act.json", "r", encoding="utf-8") as f:
    data = json.load(f)

with open("complex_queries.json", "r", encoding="utf-8") as f:
    complex_queries = json.load(f)

embedding_model = HuggingFaceEmbeddings(model_name="sentence-transformers/all-MiniLM-L6-v2")

if not os.path.exists("faiss_index"):
    documents = [
    f"{law['Description']}\n{law['Content']}"
    for law in data
    ]
    
    vector_db = FAISS.from_texts(documents, embedding_model)
    vector_db.save_local("faiss_index")
else:
    vector_db = FAISS.load_local("faiss_index", embedding_model, allow_dangerous_deserialization=True)

def is_irrelevant_query(query):

    LEGAL_KEYWORDS = {
    "law", "legal", "section", "punishment", "cyber", "crime", "hacking", "fraud",
    "identity theft", "theft", "scam", "pornography", "privacy", "phishing", "stalking", "authentication",
    "harassment", "impersonation", "defamation", "hacked", "data breach", "cyber law", "messages", "electronic"
    }
    words = set(re.findall(r'\b\w+\b', query.lower()))
    return not bool(words & LEGAL_KEYWORDS)  

def faiss_search(query):
    """
    Perform FAISS vector search only if the query contains legal keywords.
    """
    try:
        if is_irrelevant_query(query):
            print("[DEBUG] Query is irrelevant. Skipping FAISS search.")
            return None

        results = vector_db.similarity_search_with_score(query, k=10)

        if not results:
            print("[DEBUG] No results found in FAISS.")
            return None

        print(f"[DEBUG] FAISS Results for '{query}':")
        for i, (match, score) in enumerate(results):
            print(f"{i+1}. {match.page_content.strip()} (Score: {score})")

        best_match, best_score = results[0]
        response = best_match.page_content.strip()

        if best_score < 1.0:
            print(f"[DEBUG] FAISS Score too low ({best_score}). Ignoring response.")
            return None

        print(f"[DEBUG] FAISS Best Match Selected: {response}, Score: {best_score}")
        return response

    except Exception as e:
        print(f"[ERROR] FAISS search failed: {str(e)}")
        return None


def get_best_match(query):
    """
    First checks if the query asks for a specific section.
    If no exact match is found, falls back to FAISS search.
    """
    try:
        print(f"[DEBUG] Searching for: {query}")

        match = re.search(r"section (\d+[A-Za-z]*)", query, re.IGNORECASE)
        if match:
            section_number = match.group(1).strip().lower()  

            for law in data:
                if str(law["Section"]).lower() == section_number:
                    if "omitted" in law["Description"].lower():
                        return f"Section {law['Section']} is an omitted section and does not contain legal content."
                    return f"{law['Description']}\n{law['Content']}"

            return f"Section {section_number.upper()} is not under the IT Act."

        return None

    except Exception as e:
        print(f"[ERROR] get_best_match() failed: {str(e)}")

    return None

def handle_complex_queries(query):
        
    query_list = [entry["Query"].lower() for entry in complex_queries]
    
    match = process.extractOne(query.lower(), query_list, scorer=fuzz.partial_ratio)

    if match:
        best_match, score, _ = match
        print(f"[DEBUG] User Query: {query}")  
        print(f"[DEBUG] {best_match} Best Match Score: {score}")  
        
        if score >= 85:  
            for entry in complex_queries:
                if entry["Query"].lower() == best_match:
                    return entry["Response"]

    return None

@app.route("/chatbot", methods=["POST"])
def chatbot():
    try:
        data = request.get_json()
        if not data or "query" not in data:
            return jsonify({"error": "Invalid request format"}), 400
        
        user_query = data["query"].strip().lower()
        
        best_match = get_best_match(user_query)
        if best_match:
            return jsonify({"response": best_match})

        complex_response = handle_complex_queries(user_query)
        if complex_response:
            return jsonify({"response": complex_response})

        faiss_response = faiss_search(user_query)
        if faiss_response:
            return jsonify({"response": faiss_response})

        return jsonify({"response": "Sorry I couldn't fetch any relevant legal information."})
    
    except Exception as e:
        print(f"[ERROR] {str(e)}")  
        return jsonify({"error": "Internal Server Error", "details": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)