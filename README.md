# AWS-DBT-Snowflake Data Engineering Project

A data engineering project demonstrating the use of **AWS, Snowflake, and dbt (Data Build Tool)** to build and manage a structured data transformation pipeline. The project focuses on transforming raw data into clean, structured, and analytics-ready datasets using SQL-based transformations and dbt features.

## Project Overview

This project implements a modern data transformation workflow using Snowflake as the cloud data warehouse and dbt for data modeling and transformation.

The pipeline is designed to organize raw datasets into structured layers, apply data cleaning and transformation logic, maintain data quality through testing, and support efficient incremental data processing.

## Technology Stack

| Technology | Purpose |
|---|---|
| AWS | Cloud infrastructure and data ecosystem |
| Snowflake | Cloud data warehouse |
| dbt Core | Data transformation and modeling |
| SQL | Data cleaning and transformations |
| Python | Development environment and tooling |
| Git & GitHub | Version control and project management |

## Key Features

- **Data Transformation:** Uses dbt models to transform raw data into structured datasets.
- **Incremental Loading:** Processes new or changed records without rebuilding the entire dataset.
- **Data Quality Testing:** Implements dbt tests to validate data integrity and reliability.
- **Data Cleaning:** Handles missing values, standardizes columns, and applies transformation logic.
- **Snowflake Integration:** Uses Snowflake as the centralized cloud data warehouse.
- **Modular Data Modeling:** Organizes transformations into reusable dbt models.
- **Version Control:** Uses Git branches and commits to manage project development.

## Project Structure

```text
AWS-DBT-Snowflake/
│
├── aws_dbt_snowflake_project/
│   ├── models/
│   │   ├── staging/
│   │   └── ...
│   │
│   ├── tests/
│   ├── snapshots/
│   ├── macros/
│   ├── seeds/
│   ├── analyses/
│   ├── dbt_project.yml
│   └── profiles.yml
│
├── src/
│   └── aws_dbt_Snowflake/
│
├── .gitignore
├── pyproject.toml
├── uv.lock
└── README.md
```


## Prerequisites

Before running the project, ensure you have:

- Python installed
- dbt Core installed
- Snowflake account
- AWS account, if required by your ingestion workflow
- Git installed
- Snowflake credentials and warehouse configuration

## Installation and Setup

### 1. Clone the Repository

```bash
git clone https://github.com/Likhithreddy22/AWS-DBT-Snowflake.git
```

### 2. Navigate to the Project

```bash
cd AWS-DBT-Snowflake/aws_dbt_snowflake_project
```

### 3. Install dbt Dependencies

```bash
dbt deps
```

### 4. Configure Snowflake Connection

Configure your dbt profile in `profiles.yml`.

Keep credentials outside GitHub and use environment variables for sensitive values.

Configure the environment variables in your local environment.

### 5. Test the Connection

```bash
dbt debug
```

### 6. Run dbt Models

```bash
dbt run
```

### 7. Execute Data Quality Tests

```bash
dbt test
```

### 8. Generate dbt Documentation

```bash
dbt docs generate
dbt docs serve
```

## Data Transformation Workflow

The project follows a layered transformation approach:

**Raw Layer**
- Stores source data in Snowflake.
- Acts as the initial layer for transformation.

**Staging Layer**
- Standardizes column names.
- Cleans and transforms raw records.
- Handles null values and data inconsistencies.

**Silver Layer**
- Applies business transformation logic.
- Creates structured datasets.
- Supports incremental processing where configured.

**Analytics Layer**
- Produces transformed datasets suitable for reporting and analytical queries.

## Data Quality and Validation

dbt testing helps ensure the reliability of transformed data.

Common validations include:

- Unique key validation.
- Not-null validation.
- Referential integrity checks.
- Source freshness checks, where configured.
- Custom SQL-based data quality tests.

## Incremental Processing

Incremental models help optimize data processing by identifying and processing new or changed records rather than rebuilding complete tables.

This reduces unnecessary processing and improves pipeline efficiency when configured with appropriate unique keys and incremental filters.

## Version Control

Git is used to maintain project history and manage development branches.

Example workflow:

```bash
git add .
git commit -m "Updated dbt models"
git push origin main
```

## Future Enhancements

- Automate data ingestion using AWS services.
- Implement scheduled dbt execution.
- Integrate CI/CD pipelines using GitHub Actions.
- Improve data quality monitoring.
- Implement automated pipeline orchestration.
- Build dashboards using analytics-ready datasets.
