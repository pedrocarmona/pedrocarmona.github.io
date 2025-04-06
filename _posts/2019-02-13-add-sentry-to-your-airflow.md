---
layout: post
categories: ["blog"]
date: "2019-02-13T12:15:17+01:00"
tags: ["airflow", "sentry", "blog"]
title: "Add sentry to your airflow"
description: "Describe how to send airflow errors to sentry"
---

Since this [pull request](https://github.com/apache/airflow/pull/2135) in airflow github repository, it is possible to send errors to sentry. This way you get a sentry alert every time an error or a SIGTERM happens.

My configuration

dags/notify_sentry.py

```
import os
import sentry_sdk
from sentry_sdk import capture_exception, configure_scope
# requires sentry-sdk==0.7.0


def sentry_capture_exception(context):
    """
        Sends Error to Sentry.
        op = BashOperator(
            dag=my_dag,
            task_id='my_task',
            python_callable=my_python_job,
            on_failure_callback=sentry_capture_exception
        )
    """
    dsn = os.getenv('SENTRY_DSN')
    sentry_sdk.init(dsn)
    error = context.get('exception')

    with configure_scope() as scope:
        scope.set_extra('dag', context.get('dag'))
        scope.set_extra('dag_run', context.get('dag_run'))
        scope.set_extra('ds', context.get('ds'))
        scope.set_extra('end_date', context.get('end_date'))
        scope.set_extra('execution_date', context.get('execution_date'))
        scope.set_extra('latest_date', context.get('latest_date'))
        scope.set_extra('params', context.get('params'))
        scope.set_extra('run_id', context.get('run_id'))
        scope.set_extra('task', context.get('task'))
        scope.set_extra('task_instance', context.get('task_instance'))
        scope.set_extra('ti', context.get('ti'))
        scope.set_extra('ts', context.get('ts'))
        scope.set_extra('yesterday_ds', context.get('yesterday_ds'))

    capture_exception(error)
```


then in your dag:

dags/my_dag.py

```
from notify_sentry import sentry_capture_exception

...


op = BashOperator(
    dag=my_dag,
    task_id='my_task',
    python_callable=my_python_job,
    on_failure_callback=sentry_capture_exception
)

```

Sometimes, you might need to add `provide_context=True` to the operator parameters.
