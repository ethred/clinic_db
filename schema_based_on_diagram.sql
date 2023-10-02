CREATE TABLE patients
(
    id INT PRIMARY KEY,
    date DATE,
    name VARCHAR(255),
    date_of_birth DATE
);
CREATE TABLE medical_histories
(
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255),
    FOREIGN KEY (patient_id) REFERENCES patients(id)
);
CREATE TABLE treatments
(
    id INT PRIMARY KEY,
    type VARCHAR(255),
    name VARCHAR(255)
);
CREATE TABLE invoices
(
    id INT PRIMARY KEY,
    total_amount DECIMAL(10,2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items
(
    id INT PRIMARY KEY,
    unit_price DECIMAL(10,2),
    quantity INT,
    total_price DECIMAL(10,2),
    invoice_id INT,
    treatment_id INT,
    FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

CREATE TABLE treatments_histories
(
    treatment_id INT,
    medical_history_id INT,
    PRIMARY KEY (treatment_id, medical_history_id),
    FOREIGN KEY (treatment_id) REFERENCES treatments(id),
    FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);