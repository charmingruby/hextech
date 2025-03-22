TF_BUCKET ?= ""
TF_KEY ?= ""
TF_REGION ?= ""
TF_PROFILE ?= ""
TF_DYNAMODB_TABLE ?= ""

setup-be:
	terraform init -backend=true \
	  -backend-config="bucket=$(TF_BUCKET)" \
	  -backend-config="key=$(TF_KEY)" \
	  -backend-config="region=$(TF_REGION)" \
	  -backend-config="profile=$(TF_PROFILE)" \
	  -backend-config="dynamodb_table=$(TF_DYNAMODB_TABLE)"
