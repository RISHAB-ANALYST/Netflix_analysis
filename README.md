# 🎬 Netflix Data Analysis using SQL (PostgreSQL)

#### This project showcases hands-on SQL analysis performed on the Netflix dataset, using PostgreSQL to explore insights about movies, TV shows, genres, actors, and content trends.
It demonstrates data cleaning, text processing, aggregations, and advanced SQL concepts like window functions, regular expressions, and string operations.

## 📂 Project Overview

### **The goal of this project is to analyze the Netflix catalog to uncover insights such as:** 
#### *How content is distributed across types, countries, and years*
#### *Which actors and directors contribute the most*
#### *Which genres dominate the platform*
#### *Trends in documentary content*
#### *Identifying “bad” vs “good” content based on keywords in descriptions*

## All queries are written, tested, and optimized for PostgreSQL.

# 🧠 Key Learning Objectives

### SQL data analysis using real-world data
### Text and string manipulation using STRING_TO_ARRAY(), UNNEST(), and regex
### Use of aggregate functions, CASE statements, and window functions
### Extracting and transforming semi-structured data (comma-separated values)
### Applying filters, sorting, and ranking for business insights

# 🛠️ Tech Stack

### Language: SQL
### Database: PostgreSQL
### Dataset: Netflix Titles Dataset
### Tools: pgAdmin / DBeaver / psql

# 🧩 SQL Queries Summary
1️⃣ Movies vs TV Shows

Count total Movies and TV Shows.

2️⃣ Most Common Rating by Type

Find the most frequent content rating for Movies and TV Shows using RANK().

3️⃣ Movies Released in 2020

List all movies released in a given year.

4️⃣ Top 5 Countries by Content

Unnest country lists to find countries producing the most Netflix content.

5️⃣ Longest Movie

Extract and compare duration values to find the longest movie.

6️⃣ Content Added in Last 10 Years

Filter content added within a time range using TO_DATE() and date arithmetic.

7️⃣ Movies/Shows by a Specific Director

Search for works directed by “Rajiv Chilaka”.

8️⃣ TV Shows with More Than 5 Seasons

Filter and cast string-based duration to integers.

9️⃣ Count of Content per Genre

Unnest and count all genres listed in listed_in.

🔟 Average Annual Content by India

Calculate the percentage contribution of content added each year from India.

11️⃣ Top 5 Years for Documentaries

Two solutions — one using UNNEST + TRIM, another using ILIKE search.

12️⃣ Movies That Are Documentaries

Simple pattern match for documentaries.

13️⃣ Content Without a Director

Identify rows with missing director.

14️⃣ Top 10 Indian Actors

Unnest the casts column to find actors appearing most in Indian content.

15️⃣ Categorize Content as “Good” or “Bad”

Use regex to classify descriptions containing keywords like kill, violence, killer, etc.

📊 Example Insights

India ranks among the top contributors to Netflix content.

“Documentaries” have shown consistent growth over the years.

Certain actors dominate regional content.

Content descriptions can be text-mined for thematic classification.
