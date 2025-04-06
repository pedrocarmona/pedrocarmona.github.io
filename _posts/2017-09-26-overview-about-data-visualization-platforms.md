---
layout: post
categories: ["blog"]
date: "2017-09-26T23:07:17+02:00"
tags: ["tableau", "superset", "blazer", "github", "blog"]
title: "Data Visualization Platforms"
description: "Overview about data visualization platforms"
---

Nowadays, their are multiple report solutions that allow marketeers and data analysts to view and analyse data. This reporting tools connect to databases and prepare the data for visualization.
Within this article several report platforms will be compared, using the following parameters:

* [Supported Databases](#supported-databases)
* [Query caching](#query-caching)
* [Team share](#team-share)
* [Install requirements](#install-requirements)
* [Permissions](#permissions)
* [Storage and Versioning](#storage-and-versioning)
* [Pricing](#pricing)

## Supported databases

* [Tableau](www.tableau.com) supports a wide variety of databases, including Amazon Athena, Amazon Redshift, Anaplan, Apache Drill, Cloudera Hadoop Hive and Impala, Firebird, Google BigQuery, Microsoft Azure Data Lake, Microsoft SQL Server, MonetDB, MongoDB BI, MySQL 5.0, Oracle Database, Pivotal Greenplum, PostgreSQL, Presto, Snowflake.
* [Superset](https://github.com/apache/incubator-superset) supports MySQL, Postgres, Vertica, Oracle, Microsoft SQL Server, SQLite, Greenplum, Firebird, MariaDB, Sybase,IBM DB2, Exasol, MonetDB, Snowflake, Redshift. Redshift, Mysql and Druid.
* [Blazer](https://github.com/ankane/blazer) supports PostgreSQL, MySQL, SQL Server, Oracle, IBM DB2 and Informix, SQLite, Amazon Redshift, Amazon Athena, Presto, Apache Drill, Google BigQuery, MongoDB, Elasticsearch.

## Query caching

Query caching allows reporting tools to improve the usability of their service.

* [Tableau](www.tableau.com) users can predifine if a given source is stored in an extract. Usually, this speeds up the response time of the reporting tool.
* [Superset](https://github.com/apache/incubator-superset) dashboards have configurable caching.
* [Blazer](https://github.com/ankane/blazer) by default it will cache for one hour queries that take longer than 15 seconds. The threshould and cache time is configurable by datasource.

## Team Share
Using web browser reporting tools may offer the ability to easily share the result of a given query, or share a dashboard with specific filters.

* In [Tableau](www.tableau.com), with tableau online isnt possible to save the current state of the filter, because the url isnt mutated with the filters. Also users cannot simple run SQL queries directly.
* [Superset](https://github.com/apache/incubator-superset)
* [Blazer](https://github.com/ankane/blazer) users can share dashboards with parameters and adhoc queries and their results easilly.

## Install requirements
* [Tableau](www.tableau.com) the desktop version is avaliable for windows and mac. Tableau server is deployed in an Windows environment.
* [Superset](https://github.com/apache/incubator-superset) Python and preferable unix environment.
* [Blazer](https://github.com/ankane/blazer) Ruby on Rails and preferable unix environment.

## Permissions
Access control is a feature that allows the administrator of the tool the control the permissions of the users on a given report.

* [Tableau](www.tableau.com) has a permissions system embed.
* [Superset](https://github.com/apache/incubator-superset) contains a customizable permission system.
* In [Blazer](https://github.com/ankane/blazer) users can create queries that cannot be edited by other users.

## Storage and Versioning

Storing the reports in an external storage like a git repo allows the maintainers of the reports to track changes, create tags with deployed versions, and control the code accessibility.

* In [Tableau](www.tableau.com) its possible to use a builtin backup system via the UI. On the other hand, this only contains a set of the latest versions. It is required to implement a custom development procedure, in order to safely store in an external storage all versions of the reports.
* [Superset](https://github.com/apache/incubator-superset) its not possible to use versions. Queries are saved in the database. The database can be configured with daily backups.
* With [Blazer](https://github.com/ankane/blazer) its not possible to use versions. Queries are saved in the database. The database can be configured with daily backups.

## Pricing

* [Tableau](www.tableau.com): I would recomend to use Tableau Desktop (70 euros/per user) together with the Tableau Online (42 euros/per user). I prefer Tableau Online because:
    - Its only 7 euros more expensive than Tableau Server.
    - Its enough for small that dont require complex data manipulation.
    - However at the moment it cannot use python or
    R Server to enhance the reports (its only possible in Tableau Server)
* [Superset](https://github.com/apache/incubator-superset) is a custom deployed solution and the cost would be arround 40 euros per month for a small team.
* [Blazer](https://github.com/ankane/blazer) if the company already uses an administration panel in RubyOnRails, then this platform is for free. Otherwise requires a custom deployment

# Conclusion

I would recomend each of the reporting tools analysed for:

* [Tableau](www.tableau.com) small, medium and large business that require a easy solution, fast deployment. It includes a report generation tool and it has good documentation. Also its a predominant solution.
* [Superset](https://github.com/apache/incubator-superset) companies with an in-house engineer able to setup and perform maintenance in python and unix systems. Its an open source tool that might be predominant in the future.
* [Blazer](https://github.com/ankane/blazer) for companies using RubyOnRails. Its a simple solution that helps solve most of the use cases: Create simple dashboards and give users the ability to create SQL queries as well as download the corresponding CSV reports.

# To be continued

Evaluate features that I would like to see in such systems:

* Monitoring and Alerting
    - Integration with metrics systems or own alert system.
* Ability to comment on data
    - Tag based comments, ability to search for relative comments and identify similar situations.
    - Anotate the decision - explain and classify the situation as ignored or addressed


