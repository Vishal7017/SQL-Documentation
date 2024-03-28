import pandas as pd
import numpy as np

# Read data from the file
data = pd.read_csv('CIS_500_CE3_MonthlyMeanTemperatureCNY.txt', delimiter='\t', skiprows=1)

# Convert the 'Date' column to integers (years)
data['Date'] = data['Date'].astype(int)

# Transpose the data to have years as rows and months as columns
data = data.set_index('Date').T

# Find the maximum temperature for each year
max_temps = data.max(axis=1)

# Create tables for maximum monthly temperatures
table_2006_2014 = max_temps[(max_temps.index >= 2006) & (max_temps.index <= 2014)]
table_2015_2022 = max_temps[(max_temps.index >= 2015) & (max_temps.index <= 2022)]

# Print tables
print("Year\t\tMax monthly temperature in F")
print("2006 - 2014")
print(table_2006_2014)

# print("\nYear\t\tMax monthly temperature in F")
# print("2015 - 2022")
# print(table_2015_2022)

# # Calculate linear regression line
# years = max_temps.index.values
# max_temps_values = max_temps.values
# slope, intercept = np.polyfit(years, max_temps_values, 1)

# print(f"\nYears\t\t2006 - 2022")
# print(f"Max monthly temperature regression line\t\tTmax = {slope:.3f} * Year + {intercept:.3f}")

# # Predict maximum monthly temperatures
# predictions = [
#     (2010, slope * 2010 + intercept),
#     (2020, slope * 2020 + intercept),
#     (2100, slope * 2100 + intercept)
# ]

# print("\nYear\t\tMaximum monthly temperature (prediction in F)")
# for year, temp in predictions:
#     print(f"{year}\t\t{temp:.1f}")