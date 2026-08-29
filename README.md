# Social Media Analytics – SQL Project

## Project Overview

This project analyzes social media data using SQL to understand user activity, post performance, engagement, and business insights.

The project uses a relational database containing account, post, likes, and comments data. SQL queries are used to analyze user behavior, content performance, and engagement patterns.

## Objectives

- Analyze social media account performance
- Identify users with the highest number of followers
- Analyze post likes and comments
- Compare engagement across different content categories
- Calculate post engagement and engagement rates
- Use SQL joins, subqueries, GROUP BY, and HAVING for analysis
- Generate business insights from social media data

## Database Structure

The project contains four main tables:

### 1. ACCOUNTS
Stores information about social media users.

Key columns:
- Account ID
- Username
- Email
- City
- Followers
- Following
- Join Date

### 2. POSTS
Stores information about posts created by users.

Key columns:
- Post ID
- Account ID
- Post Title
- Category
- Likes
- Comments
- Post Date

### 3. LIKES
Stores information about likes received by posts.

Key columns:
- Like ID
- Post ID
- Account ID
- Like Date

### 4. COMMENTS
Stores information about comments made on posts.

Key columns:
- Comment ID
- Post ID
- Account ID
- Comment Text
- Comment Date

## SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- Primary Keys
- Foreign Keys
- INSERT
- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- Aggregate Functions
- INNER JOIN
- Subqueries
- CASE Statements
- LIMIT
- BETWEEN
- AVG()
- SUM()
- COUNT()
- MAX()

## Analysis Performed

### Account Analysis
- Identified users with the highest followers
- Found users above average followers
- Identified cities with the highest number of users
- Analyzed followers versus following

### Post Analysis
- Analyzed posts based on likes and comments
- Identified highly liked posts
- Identified posts with high comment activity
- Compared likes across categories
- Calculated average likes by category

### Engagement Analysis
- Classified posts into High, Medium, and Low engagement
- Calculated total engagement
- Identified the top 3 posts by engagement
- Calculated engagement rate
- Compared engagement across categories

### Business Insights
- Identified the category with the highest overall engagement
- Identified the user with the highest total engagement
- Identified the most engaging post
- Identified the category with the highest average likes
- Identified users with high engagement rates

## Tools Used

- MySQL
- SQL

## Project Files

- `Social_Media_Analytics_Project.sql` – Contains database creation, table creation, sample data, analysis queries, and business insight queries.

## Key Learning Outcomes

Through this project, I practiced using SQL to transform raw social media data into meaningful business insights.

The project helped me understand relational databases, data analysis using SQL, table relationships, joins, aggregation, subqueries, and business-focused analytical queries.
