import pandas as pd
import matplotlib.pyplot as plt
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

df = pd.read_csv('most_in_demand_skills.csv')

# Sort by demand_count in descending order for horizontal bar chart
df_sorted = df.sort_values('demand_count', ascending=True)

# Create bar chart based on demand count
plt.figure(figsize=(12,8), facecolor='#001133')  # dark blue background
ax = plt.gca()
ax.set_facecolor("#063593")  # blue chart area

bars = plt.barh(
    df_sorted['skills'],
    df_sorted['demand_count'],
    color='steelblue',
    edgecolor='#001133'
)

plt.title('Most In-Demand Skills for Data Analyst Roles',
          color='white', fontsize=14, pad=15)
plt.xlabel('Demand Count', color='white', fontsize=12)
plt.gca().invert_yaxis()  # highest demand at top

# Change axis tick colors to white
plt.xticks(color='white')
plt.yticks(color='white')

# Format x-axis to show numbers with commas
plt.gca().xaxis.set_major_formatter(plt.FuncFormatter(lambda x, p: f'{x:,.0f}'))

plt.tight_layout()
plt.show()

# print the result 
print("Most In-Demand Skills Analysis:")
print("-" * 30)
for index, row in df.sort_values('demand_count', ascending=False).iterrows():
    print(f"{row['skills']}: {row['demand_count']:,}")