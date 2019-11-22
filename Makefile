include .env
export

setup_project:
		sudo -u postgres psql -f create_database.sql -v db=${POSTGRES_DB} -v db_user=${POSTGRES_USER} -v pw="'${POSTGRES_PASSWORD}'"
		docker-compose up --build
run_project:
		docker-compose up
run_psql:
		psql -h localhost -p ${POSTGRES_PORT} -d ${POSTGRES_DB} -U ${POSTGRES_USER}
