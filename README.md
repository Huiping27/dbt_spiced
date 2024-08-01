This documentation provides a guide on setting up and using a dbt (data build tool) project to connect to a Google Cloud database (e.g., BigQuery) and execute SQL queries.

## Project Initialization

## Database Configuration
To connect dbt project to a Google Cloud database (e.g., BigQuery), and configure the profiles.yml file.

## Writing SQL Models
In dbt project directory, locate the models folder.

```
-- models/my_model.sql

with source_data as (
    select *
    from `your_dataset.your_table`
)

select *
from source_data
```

## Using the starter project

Try running the following commands:
- dbt run
- dbt test

## Author:

 - Huiping Li

## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
