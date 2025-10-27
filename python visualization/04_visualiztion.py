import pandas as pd
import matplotlib.pyplot as plt
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

df = pd.read_csv('top_skills_based_on_salary.csv')

# Sort by avg_salary in descending order for horizontal bar chart
df_sorted = df.sort_values('avg_salary', ascending=True)

# Create bar chart based on average salary
plt.figure(figsize=(12,10), facecolor='#001133')  # dark blue background
ax = plt.gca()
ax.set_facecolor("#063593")  # blue chart area

bars = plt.barh(
    df_sorted['skills'],
    df_sorted['avg_salary'],
    color='steelblue',
    edgecolor='#001133'
)

plt.title('Top-Paying Skills for Data Analyst Roles (by Average Salary)',
          color='white', fontsize=14, pad=15)
plt.xlabel('Average Annual Salary ($)', color='white', fontsize=12)
plt.gca().invert_yaxis()  # highest salary at top

# Change axis tick colors to white
plt.xticks(color='white')
plt.yticks(color='white')

# Format x-axis to show dollar amounts with commas
plt.gca().xaxis.set_major_formatter(plt.FuncFormatter(lambda x, p: f'${x:,.0f}'))

plt.tight_layout()
plt.show()

# print the result 
print("Top Skills by Average Salary Analysis:")
print("-" * 40)
for index, row in df.sort_values('avg_salary', ascending=False).iterrows():
    print(f"{row['skills']}: ${row['avg_salary']:,.2f}")