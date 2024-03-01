# import pandas as pd
# import numpy as np
# from scipy.stats import pearsonr

# # Load the data
# df = pd.read_csv('CIS_500_CE2_Rainfall.txt')

# # Calculate statistics for each month and year
# grouped = df.groupby(['Year', 'Month'])

# temp_stats = grouped['Temperature'].agg(['max', 'mean', 'min', 'median', 'std'])
# rain_stats = grouped['Rainfall'].agg(['max', 'mean', 'min', 'median', 'std'])
# snow_stats = grouped['Snowfall'].agg(['max', 'mean', 'min', 'median', 'std'])

# # Calculate correlation between average monthly rainfall and temperature
# rain_temp_corr = grouped.apply(lambda x: pearsonr(x['Rainfall'], x['Temperature'])[0])

# # Calculate correlation between average monthly snowfall and temperature
# snow_temp_corr = grouped.apply(lambda x: pearsonr(x['Snowfall'], x['Temperature'])[0])

# print('Temperature Statistics:\n', temp_stats)
# print('Rainfall Statistics:\n', rain_stats)
# print('Snowfall Statistics:\n', snow_stats)
# print('Correlation between average monthly rainfall and temperature:\n', rain_temp_corr)
# print('Correlation between average monthly snowfall and temperature:\n', snow_temp_corr)

import pandas as pd

# Load the temperature data
df_temp = pd.read_csv('CIS_500_S24_CE2_MeanTemperature.csv')

# Group the data by 'Year' and 'Month'
grouped_temp = df_temp.groupby(['Year', 'Month'])

# Calculate the required statistics for each group
temp_stats = grouped_temp['Temperature'].agg(['max', 'mean', 'min', 'median', 'std'])

# Filter the data for the period 2006 - 2022
temp_stats = temp_stats.loc[(temp_stats.index.get_level_values('Year') >= 2006) & (temp_stats.index.get_level_values('Year') <= 2022)]

# Print the calculated statistics
print(temp_stats)