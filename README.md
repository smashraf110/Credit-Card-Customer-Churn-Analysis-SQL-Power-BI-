**Credit Card Customer Churn Analysis (SQL+Power BI)**
![Image](https://github.com/user-attachments/assets/8686743f-11b5-4fea-9d05-9b949643d88a)

✔ Project Objective
Analyze customer churn behavior in a credit card company using SQL-based exploration and segmentation and Power BI visualizations**. The goal is to uncover key churn drivers and develop a churn risk scoring model to support customer retention strategies.

✔ Tools Used
- SQL – MySQL / BigQuery compatible
- Power BI – Data visualization and dashboards
- GitHub – Version control and project sharing


✔ Key Analysis Steps:

1. Data Cleaning (SQL)
- Checked for duplicates (`CLIENTNUM`) – None found
- No nulls in key fields – `"Unknown"` treated as a valid category
- Dataset is ready for analysis and modeling

2. Exploratory Data Analysis -EDA (SQL)
  2.1 Demographic Insights:
    - Overall churn rate: 16.1%
    - Higher churn observed among:
    - Platinum card holders (25%)
    - Doctorate degree holders (21.1%)
    - Customers aged 46–55 with Platinum or Gold cards (30–40%)

  2.2 Behavioral Insights:
  - Low product relationship (1–2) → churn up to 28%
  - Frequent contact (5+ contacts/year) → churn up to 49%
  - Low relationship + high contact → churn up to 100%** in some segments

3. Churn Risk Scoring Model (SQL)
  - “If Relationship_Count ≤ 2 AND Contacts > 4 THEN 'High Risk'
  - “Else If Contacts 3–4 THEN 'Medium Risk'
  - “Else 'Low Risk'

✔ Power BI Dashboard Structure
  
  Page 1: KPI & Overview
    Title: Credit Card Customers Churn KPI & Overview
    Goal: Snapshot of overall Churn
     Visuals:
      Card KPIs:
        - Total Customers
        - Total Churned Customers
        - Churn Rate (%)
        - Average Customer Age

      Donut Chart: Churned vs. Existing Customers
      Stacked Column Chart: Churn Rate by Gender
      Stacked Bar Chart: Churn Rate by Education Level
      Clustered Bar Chart: 
        - Churn Rate by Income Category
        - Churn Rate by Age Group
        - Churn Rate by Card  Category

  Page 2: Demographic Analysis
    Title: Credit Card Customers Churn - Demographic Insights
    Goal: Show who is more likely to churn demographically
    Visuals:
      Stacked Column:
        - Age Group + Card Category vs. Churn Rate
        - Education_Level + Gender vs Churn Rate
      Slicer/Filter:
        - Education
        - Age Group
        - Income_Category

  Page 3: Behavioral Analysis
    Title: Credit Card Customers Churn - Behavioral Insights
    Goal: Understand what behaviors drive churn
    Visuals:
      Bar/Column Charts:
        - Churn Rate by Contact Frequency
        - Churn Rate by Total Relationship Count
      Matrix Table: Relationship Count + Contact Level → Churn %
      Line Chart: Credit Limit vs. Avg Utilization Ratio

  Page 4: Churn Risk Scoring
    Title: Churn Risk Segmentation
    Goal: Identify with Churn Risk Score
    Visuals:
      Stacked Bar Chart: Count of Customers by Churn Risk Score
      Table: Top 10 High Risk Customer Profiles


✔ Business Insights
  - Frequent customer contact may signal problems, not engagement.
  - Cross-selling more products reduces churn significantly.
  - Targeted outreach needed for Platinum holders aged 46–55.
  - Customers with unknown education or low relationships need special onboarding or loyalty plans.


✔ Target Audience
This project is useful for:
  - Recruiters looking for SQL + BI portfolio projects
  - Fintech and banking companies
  - Freelance clients seeking actionable data solutions

✔ Contact
Shoeb Md Ashraf  
📧 smashraf110@gmail.com  
🌐 [LinkedIn] (https://www.linkedin.com/in/shoebmdashraf/ | 
🌐GitHub: [@smashraf110](https://github.com/smashraf110)

✔ If you found this project helpful, feel free to star or fork it on GitHub!

____________________________________________________________________________

✔ Dataset
- Source: [Kaggle - Bank Churners Dataset](https://www.kaggle.com/datasets/sakshigoyal7/credit-card-customers)
- Size: ~10,000 records
- Fields Include:
  - Demographic: Age, Gender, Education, Marital Status, Income
  - Behavioral: Tenure, Contact frequency, Card category, Utilization
  - Churn status (target): `Attrition_Flag`


