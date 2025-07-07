import pandas as pd

# Load the original file (make sure it's in the same folder or give full path)
df = pd.read_csv("owid-covid-data.csv")

# Remove rows where 'continent' is NaN (e.g., World, Asia, etc.)
df = df[df['continent'].notna()]

# Select only the useful columns
columns_to_keep = [
    'iso_code', 'continent', 'location', 'date',
    'total_cases', 'new_cases', 'total_deaths', 'new_deaths',
    'total_vaccinations', 'people_vaccinated', 'people_fully_vaccinated',
    'population'
]

df = df[columns_to_keep]

# Fill empty numeric values with 0 (optional)
numeric_cols = df.select_dtypes(include='number').columns
df[numeric_cols] = df[numeric_cols].fillna(0)

# Convert date column to proper format (optional but useful)
df['date'] = pd.to_datetime(df['date']).dt.date

# Save cleaned file
df.to_csv("cleaned_covid.csv", index=False)

print("✅ Cleaned data saved as 'cleaned_covid.csv'")
