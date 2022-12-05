import variables as var
import os
class MOCK_PostgresRecoverJob:
    def __init__(self):
        self.name = "postgres-recover"
        self.namespace = "data"
        self.manifest= {
            "schedule":"0 4 * * *",
            "container":{
                "name"  : "postgres-backup",
                "image" : "mdillon/postgis:11",
                "POSTGRES_USER": "admin",
                "POSTGRES_PASSWORD" : "secret",
                "DEFAULT_REGION" : "us-east-2",
                "AZURE_STORAGE_BACKUP_PATH": f"https://${var.account}.blob.core.windows.net/dev-db-backup/postgres-backup",
                "command" : ["/bin/sh", "-c", "/do_recover.sh"]
            },
            "service_account_name": "custom-sa-postgres-backup-dev"
        }

infodb = MOCK_PostgresRecoverJob()

os.environ["DBNAME"] = infodb.name
os.environ["NAMESPAC"] = infodb.namespace
os.environ["CONTAINER_NAME"] = infodb.manifest["container"]["name"]
os.environ["IMAGE"] = infodb.manifest["container"]["image"]
os.environ["POSTGRES_USER"] = infodb.manifest["container"]["POSTGRES_USER"]
os.environ["POSTGRES_PASSWORD"] = infodb.manifest["container"]["POSTGRES_USER"]
os.environ["DEFAULT_REGION"] = infodb.manifest["container"]["DEFAULT_REGION"]
os.environ["AZURE_STORAGE_BACKUP_PATH"] = infodb.manifest["container"]["AZURE_STORAGE_BACKUP_PATH"]
os.environ["COMMAND"] = infodb.manifest["container"]["command"]
os.environ["ENV"] = var.ENV
os.environ["ACCOUNT_NAME"] = var.account