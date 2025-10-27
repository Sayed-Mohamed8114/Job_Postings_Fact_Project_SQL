import pandas as pd
import matplotlib.pyplot as plt
import os

os.chdir(os.path.dirname(os.path.abspath(__file__)))

df = pd.read_csv('top_paying_skills.csv')

# basic skills frequency 
skills_freq = df['skills'].value_counts()

# create simple bar chart 
plt.figure(figsize=(12,8), facecolor='#001133')  # dark blue background
ax = plt.gca()
ax.set_facecolor("#063593")  # off-white chart area

bars = plt.barh(
    skills_freq.index,
    skills_freq.values,
    color='steelblue',
    edgecolor='#001133'
)

plt.title('Most In-Demand Skills for Top-Paying Data Analyst Roles (2023)',
          color='white', fontsize=14, pad=15)
plt.gca().invert_yaxis()  # highest frequency at top

# Change axis tick colors to white
plt.xticks(color='white')
plt.yticks(color='white')
# remove value labels (no counters)
# → just comment out or remove the labeling loop

plt.tight_layout()
plt.show()

# print the result 
print("skills frequency analysis:")
print("-" * 30)
for skill, count in skills_freq.items():
    print(f"{skill}: {count}")
