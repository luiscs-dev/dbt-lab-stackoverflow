# Analytics Project with BigQuery and DBT - Stackoverflow

![Alt text](dbt.png?raw=true "Cloud Diagram BigQuery-DBT")

This project was created following the content and instructions from 
the course: **Analytics Engineering en Google Cloud con DBT**

You can find more information [here](https://www.udemy.com/course/analytics-engineering-en-google-cloud-con-dbt/).

The tools used to create this project are:
- BigQuery
- [DBT Cloud](https://www.getdbt.com/product/what-is-dbt/)
- Shipyard
- Slack
- Looker Studio

***

## Prerequisites 
- DBT Cloud account, create one [here](https://www.getdbt.com/signup/).
- Slack account, create one [here](https://slack.com/)
- Shipyard account, create one [here](https://www.shipyardapp.com/)

***

## Set up BigQuery 
Create a dataset to store our tables.
You can create it manually or with the command [line](
https://cloud.google.com/bigquery/docs/datasets#bq).
```
bq --location=us mk stackoverflow
```

Create a service account to connect BigQuery and DBT.
You must set BigQuery Admin role.
Get JSON key file for the service account.

Create source tables base on public datasets
```
CREATE TABLE stackoverflow.badges
COPY bigquery-public-data.stackoverflow.badges;

CREATE TABLE stackoverflow.posts_questions
COPY bigquery-public-data.stackoverflow.posts_questions;

CREATE TABLE stackoverflow.posts_answers
COPY bigquery-public-data.stackoverflow.posts_answers;

CREATE TABLE stackoverflow.users
COPY bigquery-public-data.stackoverflow.users;
```

***

## Set up DBT Cloud

**DBT** allows us to transform data using SQL. It can be integrated in a CI/CD pipeline and it creates documentation about models.

It runs over data store in a data warehouse such as BigQuery, Snowflake, Redshift or Databricks.

### Notes

DBT project structure:
- models: SQL data transformations
- macros: reuseable codes
- tests
- analyses

Data Quality is set using the schema.yml. You can set foreach column its tests 
to be validated. For example the id column must be **unique** and **not_null**.

DBT has generic tests (unique, not_null, accepted_values, relationships) which you can use but if you need more expecific rules
you can take a look at [dbt_expectations](https://github.com/calogica/dbt-expectations)

Commands:
- dbt run --select %my model name%
- dbt test --select %my model name%

Data Lineage
<img width="1150" src="https://user-images.githubusercontent.com/2066453/210103440-03364254-8471-49d4-bb87-3147b20b4f29.png">

***

## Set up Shipyard

