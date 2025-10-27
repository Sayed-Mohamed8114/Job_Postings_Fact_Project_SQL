import pandas as pd
import matplotlib.pyplot as plt
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

df = pd.read_csv('top_paying_jobs.csv')

# Sort by salary in descending order and select top jobs
df_sorted = df.sort_values('salary_year_avg', ascending=True)  # Sort for horizontal bar chart

# Create bar chart based on salary
plt.figure(figsize=(12,8), facecolor='#001133')  # dark blue background
ax = plt.gca()
ax.set_facecolor("#063593")  # blue chart area

bars = plt.barh(
    df_sorted['job_title'],
    df_sorted['salary_year_avg'],
    color='steelblue',
    edgecolor='#001133'
)

plt.title('Top-Paying Data Analyst Roles by Salary (2023)',
          color='white', fontsize=14, pad=15)
plt.xlabel('Annual Salary ($)', color='white', fontsize=12)
plt.gca().invert_yaxis()  # highest salary at top

# Change axis tick colors to white
plt.xticks(color='white')
plt.yticks(color='white')

# Format x-axis to show dollar amounts
plt.gca().xaxis.set_major_formatter(plt.FuncFormatter(lambda x, p: f'${x:,.0f}'))

plt.tight_layout()
plt.show()

# print the result 
print("Top Paying Jobs by Salary:")
print("-" * 30)
for index, row in df.sort_values('salary_year_avg', ascending=False).iterrows():
    print(f"{row['job_title']}: ${row['salary_year_avg']:,.2f}")