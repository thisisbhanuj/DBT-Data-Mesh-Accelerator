
from datetime import timedelta
from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.operators.bash import BashOperator

default_args = {
    "owner": "Data Observability",
    "retries": 2,  # retry twice on failure
    "retry_delay": timedelta(minutes=10),  # wait 10 min between retries
    "email": ["tobhanuj.kashyap@gmail.com"],  # alert recipients
    "email_on_failure": True,
    "email_on_retry": False,
    "execution_timeout": timedelta(hours=2),  # max run time per task
}

with DAG(
    dag_id="dbt_transformation_pipeline",
    default_args=default_args,
    schedule_interval="@daily",
    start_date=days_ago(1),
    catchup=False,
    tags=["dbt", "bhanuj", "Data Observability", "analytics-engineering"],
) as dag:

    dbt_run = BashOperator(
        task_id="dbt_run",
        bash_command=(
            "dbt run --profiles-dir /usr/local/airflow/dags/dbt_profiles "
            "--project-dir /usr/local/airflow/dags/dbt_project"
        )
    )

    dbt_test = BashOperator(
        task_id="dbt_test",
        bash_command=(
            "dbt test --profiles-dir /usr/local/airflow/dags/dbt_profiles "
            "--project-dir /usr/local/airflow/dags/dbt_project"
        )
    )

    dbt_run >> dbt_test
