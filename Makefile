.SILENT: test

dep:
	@if [ -z ${ENVIRONMENT} ]; then { echo "ENVIRONMENT is var not defined"; exit 1; } fi  
 
dev-start: 
	@echo "Iniciando stack de desenvolvimento...\n"
	@docker-compose up --build -d

dev-stop: 
	@echo "Parando stack de desenvolvimento...\n"
	@docker-compose down --remove-orphans	