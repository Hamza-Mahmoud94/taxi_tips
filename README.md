Welcome to the taxt tips project!

### Using the starter project

Try running the following commands to start:
- dbt run --full-refresh
OR
- dbt run 

#### Information
1- source_chicago_taxi_trips.sql --> extracting tips from bigquery-public-data.chicago_taxi_trips.taxi_trips the  informations related to each taxi_id
2- monthly_tips.sql --> using *source_chicago_taxi_trips* model to have tips for each month of the year **2008**
3- top_3_taxis_april_2018.sql --> using *monthly_tips* model to have the top 3 taxis with the highest tips
4- tips_change.sql --> for running this for a free tier better to use 
  ``` materialized='view' ```
  also can use 
  ``` materialized='incremental' ```
the model is showing the difference in tips between the three taxis which has the highest tips in april and comparing these tips to each months' tips

#### Instructions
- Add your service account credentials to this json file conf\.dbt\gbd_creds.json
- open terminal and write **dbt run --full-refresh** for **materialized='view'** in the tips_change model **OR**  open terminal and write **dbt run** for **materialized='incremental'**
- 
### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
