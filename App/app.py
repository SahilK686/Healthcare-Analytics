import streamlit as st
import pandas as pd
import pickle


# Load Model
model = pickle.load(
    open("../models/healthcare_model.pkl", "rb")
)

scaler = pickle.load(
    open("../models/scaler.pkl", "rb")
)


st.title("🏥 Healthcare Test Result Prediction")

st.write("Enter patient details")


# Inputs (encoded values)

age = st.number_input(
    "Age",
    13,
    89
)

gender = st.number_input(
    "Gender (Encoded)"
)

blood_type = st.number_input(
    "Blood Type (Encoded)"
)

medical_condition = st.number_input(
    "Medical Condition (Encoded)"
)

insurance = st.number_input(
    "Insurance Provider (Encoded)"
)

billing = st.number_input(
    "Billing Amount"
)

admission = st.number_input(
    "Admission Type (Encoded)"
)

medication = st.number_input(
    "Medication (Encoded)"
)

stay_days = st.number_input(
    "Hospital Stay Days"
)


if st.button("Predict"):

    input_data = pd.DataFrame(
        [[
            age,
            gender,
            blood_type,
            medical_condition,
            insurance,
            billing,
            admission,
            medication,
            stay_days
        ]],
        columns=[
            'Age',
            'Gender',
            'Blood Type',
            'Medical Condition',
            'Insurance Provider',
            'Billing Amount',
            'Admission Type',
            'Medication',
            'Hospital Stay Days'
        ]
    )


    input_scaled = scaler.transform(input_data)

    prediction = model.predict(input_scaled)


    st.success(
        f"Predicted Test Result: {prediction[0]}"
    )
