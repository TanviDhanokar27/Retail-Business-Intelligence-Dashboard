import pandas as pd
from pathlib import Path

# -----------------------------
# Step 1: Define the data folder
# -----------------------------
data_path = Path(r"C:\Projects\Retail-Business-Intelligence\Data\Raw")

# -----------------------------
# Step 2: Find all CSV files
# -----------------------------
csv_files = list(data_path.glob("*.csv"))

print(f"\n✅ Found {len(csv_files)} CSV files.\n")

# -----------------------------
# Step 3: Load all CSV files
# -----------------------------
datasets = {}

for file in csv_files:
    table_name = file.stem.replace("olist_", "").replace("_dataset", "")
    datasets[table_name] = pd.read_csv(file)

print("📂 Loaded Tables:\n")

for name, df in datasets.items():
    print(f"{name:<35} Rows: {df.shape[0]:>8} | Columns: {df.shape[1]}")

print("\n" + "=" * 70)
print("ORDERS TABLE OVERVIEW")
print("=" * 70)

orders = datasets["orders"]

print("\nFirst 5 Rows")
print("-" * 70)
print(orders.head())

print("\nColumn Information")
print("-" * 70)
orders.info()

print("\nMissing Values")
print("-" * 70)
print(orders.isnull().sum())

# =====================================================
# CREATE SQLITE DATABASE
# =====================================================

import sqlite3

# Database path
db_path = r"C:\Projects\Retail-Business-Intelligence\Database\retail_bi.db"

# Create connection
conn = sqlite3.connect(db_path)

print("\n✅ SQLite database created successfully!")

# =====================================================
# LOAD DATAFRAMES INTO SQLITE
# =====================================================

for table_name, df in datasets.items():
    df.to_sql(
        table_name,
        conn,
        if_exists="replace",
        index=False
    )

print("✅ All tables loaded into SQLite successfully!")

conn.close()

print("✅ Database connection closed.")