# dbt-data-mesh-accelerator

A modular, scalable dbt project accelerating data mesh adoption by transforming and modeling ecommerce data on Snowflake. Enables lineage tracking, semantic views, and analytics-ready datasets for enterprise data teams.

## Features

- Builds lineage-aware tables from TPCH and TPCDS Snowflake sample datasets  
- Implements semantic views for unified ecommerce analytics  
- Organizes models into schema-based folders for clarity and maintainability  
- Configured with materializations optimized for performance and freshness  
- Role-based access control via Snowflake grants  
- Ready for orchestration with Airflow or other schedulers  

## Getting Started

1. Clone the repo  
2. Configure your Snowflake credentials in `profiles.yml`  
3. Run `dbt deps` to install dependencies  
4. Run `dbt run` to build models  
5. Run `dbt test` to validate data quality  

## Project Structure

- `models/LINEAGE_SCHEMA` — custom lineage and summary tables  
- `models/TPCDS` — base views on TPCDS dataset  
- `models/SEMANTIC_VIEWS` — semantic views combining facts and dimensions  
- `models/sources` — source definitions pointing to Snowflake sample data  

## Contributing

Contributions welcome! Please raise issues or PRs for improvements and new features.

## License

MIT License
