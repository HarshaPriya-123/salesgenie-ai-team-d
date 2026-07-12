
CREATE DATABASE salesgenie_db;
USE salesgenie_db;

CREATE TABLE companies (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    industry VARCHAR(100),
    website VARCHAR(100),
    location VARCHAR(100),
    employees INT
);

CREATE TABLE contacts (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    contact_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    designation VARCHAR(100),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE leads (
    lead_id INT AUTO_INCREMENT PRIMARY KEY,
    company_id INT,
    lead_source VARCHAR(50),
    lead_status VARCHAR(50),
    created_date DATE,
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);

CREATE TABLE lead_stage (
    stage_id INT AUTO_INCREMENT PRIMARY KEY,
    lead_id INT,
    stage_name VARCHAR(50),
    updated_date DATE,
    FOREIGN KEY (lead_id) REFERENCES leads(lead_id)
);

CREATE TABLE ai_insights (
    insight_id INT AUTO_INCREMENT PRIMARY KEY,
    lead_id INT,
    lead_score INT,
    conversion_probability DECIMAL(5,2),
    recommendation VARCHAR(255),
    FOREIGN KEY (lead_id) REFERENCES leads(lead_id)
);

INSERT INTO companies(company_name,industry,website,location,employees) VALUES
('ABC Technologies','Healthcare','www.abctech.com','Hyderabad',500),
('TechNova','Software','www.technova.com','Bangalore',350),
('CloudSoft','Finance','www.cloudsoft.com','Pune',800),
('NextGen Solutions','Education','www.nextgen.com','Chennai',250),
('VisionAI','Artificial Intelligence','www.visionai.com','Hyderabad',150);

INSERT INTO contacts(company_id,contact_name,email,phone,designation) VALUES
(1,'Rahul Sharma','rahul@abctech.com','9876543210','Manager'),
(2,'Priya Reddy','priya@technova.com','9876543211','Director'),
(3,'Amit Verma','amit@cloudsoft.com','9876543212','CEO'),
(4,'Sneha Rao','sneha@nextgen.com','9876543213','Sales Head'),
(5,'Arjun Kumar','arjun@visionai.com','9876543214','Founder');

INSERT INTO leads(company_id,lead_source,lead_status,created_date) VALUES
(1,'LinkedIn','Qualified','2026-07-01'),
(2,'Website','Contacted','2026-07-02'),
(3,'Referral','New','2026-07-03'),
(4,'Cold Email','Meeting Scheduled','2026-07-04'),
(5,'Conference','Qualified','2026-07-05');

INSERT INTO lead_stage(lead_id,stage_name,updated_date) VALUES
(1,'Qualified','2026-07-02'),
(2,'Contacted','2026-07-03'),
(3,'New','2026-07-03'),
(4,'Meeting Scheduled','2026-07-05'),
(5,'Qualified','2026-07-06');

INSERT INTO ai_insights(lead_id,lead_score,conversion_probability,recommendation) VALUES
(1,92,85.50,'Send personalized email'),
(2,80,70.00,'Schedule follow-up'),
(3,65,55.25,'Collect more information'),
(4,88,82.75,'Arrange product demo'),
(5,95,90.20,'High priority lead');



SELECT * FROM companies;

SELECT * FROM contacts;

SELECT * FROM leads;

SELECT * FROM lead_stage;

SELECT * FROM ai_insights;
