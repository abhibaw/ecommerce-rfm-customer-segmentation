# E-Commerce RFM Customer Segmentation

End-to-end customer segmentation project on real e-commerce transaction
data — combining SQL analysis, RFM (Recency, Frequency, Monetary) scoring,
and K-Means clustering to identify actionable customer segments.

## 📌 Project Overview

This project analyzes ~2 years of transaction data from a UK-based online
retailer to answer a core business question: **who are our most valuable
customers, and which ones need attention?**

The analysis combines two complementary approaches:
- **Rule-based RFM segmentation** — interpretable, business-friendly segments
  (Champions, At Risk, Lost, etc.) based on quantile scoring
- **K-Means clustering** — data-driven clusters based on scaled, log-transformed
  RFM features, cross-validated against the rule-based segments

## 🧰 Tools & Tech Stack

- **Python** — Pandas, NumPy, Matplotlib, Seaborn
- **SQL** — PostgreSQL, SQLAlchemy (window functions, CTEs)
- **Machine Learning** — Scikit-learn (K-Means, StandardScaler, Silhouette Score)
- **Workflow** — Git, GitHub, branch-protected PR-based development

## 📊 Dataset

**Online Retail II** (UCI Machine Learning Repository)
[https://archive.ics.uci.edu/dataset/502/online+retail+ii](https://archive.ics.uci.edu/dataset/502/online+retail+ii)

Real transaction data from a UK-based online retailer, December 2009 –
December 2011. Includes invoice-level data across multiple countries.

## 🗂️ Project Structure

ecommerce-rfm-customer-segmentation/
├── data/
│ ├── raw/ # Original dataset
│ └── processed/ # Cleaned & intermediate CSVs
├── notebooks/
│ ├── 01_eda.ipynb # Data cleaning & exploration
│ ├── 02_sql_analysis.ipynb # PostgreSQL analytical queries
│ ├── 03_rfm_scoring.ipynb # RFM calculation & rule-based segments
│ ├── 04_kmeans_clustering.ipynb # K-Means clustering & cluster profiling
│ └── 05_insights_export.ipynb # Business insights & final export
├── sql/
│ └── queries.sql # Standalone SQL queries for review
├── outputs/
│ ├── figures/ # Saved charts
│ └── customer_segments_final.csv # Final deliverable
├── requirements.txt
└── README.md


## 🔄 Analysis Pipeline

1. **EDA & Cleaning** — Removed missing Customer IDs and cancelled invoices,
   engineered `TotalPrice`, validated data quality
2. **SQL Analysis** — Revenue by country/month, repeat vs one-time customers,
   top products, customer spend ranking (PostgreSQL via SQLAlchemy)
3. **RFM Scoring** — Calculated Recency/Frequency/Monetary per customer,
   scored 1-5 via quantiles, assigned rule-based segments
4. **K-Means Clustering** — Log-transformed and scaled RFM features,
   selected optimal k via elbow method + silhouette score, profiled clusters
5. **Insights & Export** — Revenue contribution by segment, recommended
   actions per segment, final customer-level export

## 📈 Key Results

- Total customers analyzed: `5878`
- Total revenue analyzed: `£17,743,429.18`
- Top revenue-generating segment: `Champions` — contributes `69.3%` of
  revenue from `25.2%` of customers
- Optimal K-Means clusters: `4` (selected via elbow method + silhouette score)

## 🚀 How to Run

```bash
git clone https://github.com/abhibaw/ecommerce-rfm-customer-segmentation
cd ecommerce-rfm-customer-segmentation
python -m venv venv
source venv/bin/activate   # Windows: venv\Scripts\activate
pip install -r requirements.txt
```

Download the dataset from the link above, place it at
`data/raw/online_retail_II.xlsx`, set up a local PostgreSQL database named
`ecommerce_rfm`, then run notebooks in order (01 → 05).

## 🔀 Development Workflow

This project follows a PR-based Git workflow with branch protection on
`main`. Each notebook was developed on its own feature branch and merged
via pull request:

- `feature/01-eda`
- `feature/02-sql-analysis`
- `feature/03-rfm-scoring`
- `feature/04-kmeans-clustering`
- `feature/05-insights-export`

## 👤 Author

**Abhishek Bawane**
Data Analyst — Pune, Maharashtra