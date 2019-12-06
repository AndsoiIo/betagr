# betagr (dev)

Use this repo to build up full BetAgr project


##### Available microservices:
1. sso
2. dashboard
3. aggregator
4. parser

##### Requirements
* Docker version 19.03 =>
* dockerdocker-compose 1.24 =>
* Postgresql 10 =>

### Usage

#####Setup project
1. Install docker and docker-compose
2. Сreate .env file 
3. Set environment variable in .env file with the required values (see the table at the end)
4. Setup project via `make setup_project`
5. Run project via `make run_project`

#####Run tests
1. Run tests via `make run_tests`

##### Required environment variables

|            variable name            |             value               |
|               ---                   |              ---                |
|`POSTGRES_DB`                        |           
|`POSTGRES_USER`                      |               
|`POSTGRES_PASSWORD`                  |
|`POSTGRES_HOST`                      |`host.docker.internal` (for launch db locally)
|`POSTGRES_PORT`                      |
|                                     |
|`POSTGRES_TEST_DB`                   |
|                                     |
|`DASHBOARD_HOST`                     |
|`DASHBOARD_PORT`                     |
|`DASHBOARD_WORKERS`                  |
|`DASHBOARD_ACCESS_LOG`               |
|                                     |
|`SSO_API_HOST`                       |
|`SSO_API_PORT`                       |
|                                     |
|`PARSER_API_HOST`                    |
|`PARSER_API_PORT`                    |
|                                     |
|`AGGREGATOR_API_HOST`                |
|`AGGREGATOR_API_PORT`                |
|                                     |
|`BETTING_DATA_API_HOST`              |
|`BETTING_DATA_API_PORT`              |
|                                     |
|`CAMUNDA_API_HOST`                   |
|`CAMUNDA_API_PORT`                   |
|                                     |
|`COMMON_API_CLIENT_LOGGING_LEVEL`    |                  `10`

see numeric represents logging level here: https://docs.python.org/3/library/logging.html#logging-levels