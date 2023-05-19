from matplotlib import ticker
import mysql.connector
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.ticker import FuncFormatter
from matplotlib.ticker import EngFormatter
import numpy as np

# Connect to MySQL database
cnx = mysql.connector.connect(user='root', password='18811881Hamza', database='test')

# Function to execute SQL query and return data as a pandas DataFrame
def execute_query(query):
    cursor = cnx.cursor()
    cursor.execute(query)
    columns = [column[0] for column in cursor.description]
    data = cursor.fetchall()
    df = pd.DataFrame(data, columns=columns)
    cursor.close()
    return df

# Function to format tick labels with appropriate units
def format_ticks(value, pos):
    if value >= 1e9:
        return f'{value / 1e9:.1f}B'
    elif value >= 1e6:
        return f'{value / 1e6:.1f}M'
    else:
        return f'{value:.0f}'

# Query to retrieve data from the "top_clean_energy" view
query = "SELECT * FROM top_clean_energy"
df_top_clean_energy = execute_query(query)

# Query to retrieve clean energy production by year for the mentioned countries
query = """
    SELECT energy.year, energy.clean_energy, countries.name
    FROM energy
    JOIN countries ON energy.iso_code = countries.iso_code
    WHERE countries.name IN {}
    ORDER BY energy.year
""".format(tuple(df_top_clean_energy['name']))

df_clean_energy_by_year = execute_query(query)

# Plotting the data
plt.figure(figsize=(12, 6))
for country in df_clean_energy_by_year['name'].unique():
    country_data = df_clean_energy_by_year[df_clean_energy_by_year['name'] == country]
    plt.plot(country_data['year'], country_data['clean_energy'], label=country)

plt.xlabel('Year')
plt.ylabel('Clean Energy Production')
plt.title('Clean Energy Production by Year for Top 10 Countries')
plt.legend()
plt.grid(True)
plt.tight_layout()
plt.show()

# Retrieve data from the "energy" table between 1990 and 2019
query = "SELECT year, SUM(clean_energy) AS clean_energy, SUM(dirty_energy) AS dirty_energy FROM energy WHERE year BETWEEN 1990 AND 2019 GROUP BY year"
df_energy = execute_query(query)

# Plot clean energy and dirty energy by year with formatted tick labels
plt.figure(figsize=(10, 6))
plt.plot(df_energy['year'], df_energy['clean_energy'], label='Clean Energy', color='green', marker='o')
plt.plot(df_energy['year'], df_energy['dirty_energy'], label='Dirty Energy', color='red', marker='o')
plt.xlabel('Year')
plt.ylabel('Energy (in millions)')
plt.title('Clean Energy vs. Dirty Energy by Year (1990-2019)')

# Format tick labels using the 'format_ticks' function
plt.gca().yaxis.set_major_formatter(FuncFormatter(format_ticks))

plt.legend()
plt.tight_layout()
plt.show()

# Retrieve data from the "pollution" table
query = "SELECT ozone_density, temperature_anomaly FROM pollution"
df_pollution = execute_query(query)

# Plot ozone density vs. temperature anomaly with formatted tick labels
plt.figure(figsize=(10, 6))
plt.scatter(df_pollution['ozone_density'], df_pollution['temperature_anomaly'], color='purple', alpha=0.7)
plt.xlabel('Ozone Density')
plt.ylabel('Temperature Anomaly')
plt.title('Ozone Density vs. Temperature Anomaly')

plt.tight_layout()
plt.show()

# Query to retrieve data from the "pollution_summary" view
query = "SELECT * FROM pollution_summary"
df_pollution_summary = execute_query(query)

# Query to retrieve yearly total dirty energy production
query = """
    SELECT year, SUM(dirty_energy) AS total_dirty_energy
    FROM energy
    WHERE year BETWEEN 1990 AND 2019
    GROUP BY year
    ORDER BY year
"""
df_dirty_energy = execute_query(query)

# Convert decimal values to floats for scaling
df_dirty_energy['total_dirty_energy'] = df_dirty_energy['total_dirty_energy'].astype(float)

# Plotting the data
fig, ax1 = plt.subplots(figsize=(12, 6))

# Plot for average ozone density with dots
color = 'tab:blue'
ax1.set_xlabel('Year')
ax1.set_ylabel('Average Ozone Density', color=color)
ax1.plot(df_pollution_summary['year_'], df_pollution_summary['avg_ozone_density'], 'o-', color=color, label='Average Ozone Density')
ax1.tick_params(axis='y', labelcolor=color)

# Create a secondary y-axis and scale total dirty energy production
ax2 = ax1.twinx()
formatter = EngFormatter()
scaled_dirty_energy = df_dirty_energy['total_dirty_energy'] / 1e6  # Scale to millions
ax2.set_ylabel('Total Dirty Energy Production (Millions)', color='tab:red')
ax2.plot(df_dirty_energy['year'], scaled_dirty_energy, 's-', color='tab:red', label='Total Dirty Energy Production')
ax2.tick_params(axis='y', labelcolor='tab:blue')
ax2.yaxis.set_major_formatter(formatter)

# Set titles and legends
fig.suptitle('Average Ozone Density and Yearly Total Dirty Energy Production')
fig.legend(loc='upper right')

# Adjust layout and display the plot
plt.tight_layout()
plt.show()

query_emission = """
    SELECT year_, SUM(co2_emission) AS total_co2_emission
    FROM consumer_relationship
    WHERE year_ BETWEEN 1989 AND 2018
    GROUP BY year_
    ORDER BY year_
"""
df_emission = execute_query(query_emission)

# Query to retrieve yearly population
query_population = """
    SELECT year, SUM(amount) AS total_population
    FROM population
    WHERE year BETWEEN 1989 AND 2018
    GROUP BY year
    ORDER BY year
"""
df_population = execute_query(query_population)

# Convert the columns to appropriate data types
df_emission['total_co2_emission'] = df_emission['total_co2_emission'].astype(float)
df_population['total_population'] = df_population['total_population'].astype(float)

# Plotting the data
fig, ax1 = plt.subplots(figsize=(12, 6))

# Plot CO2 production
ax1.plot(df_emission['year_'], df_emission['total_co2_emission'], 'o-', color='blue', label='CO2 Emission')

ax1.set_xlabel('Year')
ax1.set_ylabel('CO2 Emission (units)')
ax1.set_title('Total CO2 Emission and Population by Year')
ax1.set_xlim(1990, 2019)  # Set x-axis limits
ax1.legend(loc='upper left')

# Create a second y-axis for population
ax2 = ax1.twinx()

# Plot population
ax2.plot(df_population['year'], df_population['total_population'] / 1e6, 's-', color='green', label='Population (Millions)')

ax2.set_ylabel('Population (Millions)')
ax2.legend(loc='upper right')

plt.tight_layout()
plt.show()

# Close the database connection
cnx.close()
