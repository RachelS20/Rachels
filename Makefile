PROJECT_ID=MLOPS
ZONE=${DEFAULT_REGION}

run-local:
	docker-compose up

terraform-create-workspace:
	cd terraform && \
		terraform workspace new ${ENV}

terraform-init:
	cd terraform && \
		terraform workspace select ${ENV} &&\
		terraform init

terraform-plan:
	cd terraform && \
		terraform workspace select ${ENV} &&\
		terraform plan

terraform-apply:
	cd terraform && \
		terraform workspace select ${ENV} &&\
		terraform apply

