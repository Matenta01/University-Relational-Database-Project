# University Relational Database Coursework

## 📚 Overview

This project demonstrates the design and implementation of a relational database system modelling students, courses, societies, hobbies, and memberships at a university. It includes:

* Schema setup scripts (`db_setup.sql`)
* Data insertion
* Example SQL queries (`SQL_queries.sql`) for analysis and insights

---

## 🛠️ Technologies Used

* **Database:** MySQL 8.0
* **Languages:** SQL

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
```

### 2. Set Up MySQL

Ensure you have MySQL installed and running on your device. You can install it via:

* **Windows:** [MySQL Installer](https://dev.mysql.com/downloads/installer/)
* **macOS:** `brew install mysql`
* **Linux (Debian-based):** `sudo apt install mysql-server`

### 3. Run the Database Setup Script

Open MySQL Workbench or your terminal and run:

```sql
source /path/to/db_setup.sql;
```

This will:

* Create the `coursework` database
* Define all necessary tables
* Insert sample data

### 4. Run the SQL Queries

To test the queries:

```sql
USE coursework;
source /path/to/SQL_queries.sql;
```

This will execute example queries such as:

* Counting member types in societies
* Retrieving society president names
* Listing students in specific courses
* Displaying students with certain hobbies

---

## 📊 Project Highlights

* Designed normalised schemas with **primary and foreign key constraints**.
* Applied **ENUM types** and **CHECK constraints** for data validation.
* Wrote **JOIN-based queries** and nested subqueries for actionable insights.
* Modelled complex relationships between students, courses, societies, and activities.

---

## 💡 Future Improvements

* Automate data pipeline integration with Python and Snowflake.
* Optimise query performance for scalability with larger datasets.
