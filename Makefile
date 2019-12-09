include .env
export

setup_project:
		sudo -u postgres psql -f create_database.sql -v db=${POSTGRES_DB} -v db_user=${POSTGRES_USER} -v pw="'${POSTGRES_PASSWORD}'"
		@echo "\n---DATABASE OK---\n"
		docker-compose up -d camunda
		@echo "\n---VUE-UI OK---\n"
		docker-compose up -d vue-ui
		docker-compose build
		@echo "\n---COMPOSE BUILD OK---\n"
		curl -w "\n" \
            -H "Accept: application/json" \
            -F "deployment-name=BetAggr" \
            -F "enable-duplicate-filtering=true" \
            -F "deploy-changed-only=true" \
            -F "betaggr.bpmn=@betaggr.bpmn" \
            http://localhost:$(CAMUNDA_API_PORT)/engine-rest/deployment/create
		@echo "\n---BPMN DEPLOY OK---\n"

run_project:
		docker-compose up

run_psql:
		psql -h localhost -p ${POSTGRES_PORT} -d ${POSTGRES_DB} -U ${POSTGRES_USER}

run_tests:
		sudo -u postgres psql -f create_database.sql -v db=${POSTGRES_TEST_DB} -v db_user=${POSTGRES_USER} -v pw="'${POSTGRES_PASSWORD}'"
		docker-compose -f docker-compose-testing.yml build
		docker-compose -f docker-compose-testing.yml up
		docker-compose -f docker-compose-testing.yml down
		sudo -u postgres psql -f drop_database.sql -v db=${POSTGRES_TEST_DB}