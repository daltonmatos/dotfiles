alias t='terraform'
alias tm='terramate'
alias randpwd='dd if=/dev/random bs=1 count=128 2>/dev/null | tr -dc "[:alpha:]"'
alias myip='curl https://api.ipify.org\?format=json'
alias vim=nvim
alias v=vim
alias cura=~/Downloads/UltiMaker-Cura-5.9.0-linux-X64.AppImage
alias prusa=~/src/contrib/PrusaSlicer/build/src/prusa-slicer
alias claudio='CLAUDE_CONFIG_DIR=~/.claude-personal/ claude'


pgsql-ss-connect () {
  local host="${2}.postgres.database.azure.com"
  local user="${1}@${2}"
  echo "Connecting: user: ${user}\nserver: ${host}"
  PGPASSWORD=$(pass work/stone.co/azure/pgsql/${2} | head -1) pgcli -h ${host} -U ${user} postgres
}

pgsql-connect () {
  local host="${1}.postgres.database.azure.com"
  local user="dalton.barreto@stone.com.br"
  echo "Connecting: server: ${host}"
  PGPASSWORD=$(az account get-access-token --resource-type oss-rdbms | jq .accessToken | tr -d '"') psql -h ${host} -U ${user} postgres
}

pgsql-connect-admin () {
  local host="${2}.postgres.database.azure.com"
  local user="${1}"
  echo "Connecting: server: ${host}"
  PGPASSWORD=$(pass work/stone.co/azure/pgsql/${2} | head -1) pgcli -h ${host} -U ${user} postgres
}


az-sp-show-info () {
  az ad sp show --id ${1} --query "[displayName, appId]"
}

gcs-bucket-info () {
  local bucket_name=${1}
  INFO=$(curl -s -H "Authorization: Bearer $(gcloud auth print-access-token)" https://storage.googleapis.com/storage/v1/b/${bucket_name})

  project_number=$(echo ${INFO} | jq '.projectNumber')
  bucket_name=$(echo ${INFO} | jq '.name')
  #echo ${INFO} | jq
  
  PROJECT_INFO=$(gcloud projects list --filter="PROJECT_NUMBER=${project_number}" --format=json)
  project_id=$(echo ${PROJECT_INFO} | jq '.[] | .projectId')
  project_name=$(echo ${PROJECT_INFO} | jq '.[] | .name')

  echo "project_number: ${project_number} (id=${project_id} name=${project_name})"
  echo "bucket_name: ${bucket_name}"
}

bifrost-auth-stg () {
set -e
curl -s --connect-timeout 5 --location 'https://login.microsoftonline.com/1236ea7e-8bbc-43a5-a5ee-189a1954e314/oauth2/v2.0/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header 'Keep-Alive: true' \
--header 'Cookie: fpc=AgefJe7fEi9EjlukBIj9ju60xw3FAwAAAMMHJNwOAAAAC9_FsgEAAABkCCTcDgAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AgefJe7fEi9EjlukBIj9ju4lK9TRAQAAAJm0eOAOAAAA' \
--data-urlencode 'client_id=bee00e6f-3fb5-4899-ac40-6d6f38ff5407' \
--data-urlencode 'grant_type=client_credentials' \
--data-urlencode 'scope=api://1741cb81-fb83-4b33-91e3-5f8139256e0a/.default' \
--data-urlencode 'client_secret=**' | jq -rc .access_token
set +e
}


bifrost-auth-prd-sales-agent-api () {
set -e
curl -s --connect-timeout 5 --location 'https://login.microsoftonline.com/1236ea7e-8bbc-43a5-a5ee-189a1954e314/oauth2/v2.0/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header 'Keep-Alive: true' \
--header 'Cookie: fpc=AgefJe7fEi9EjlukBIj9ju60xw3FAwAAAMMHJNwOAAAAC9_FsgEAAABkCCTcDgAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AgefJe7fEi9EjlukBIj9ju4lK9TRAQAAAJm0eOAOAAAA' \
--data-urlencode 'client_id=988126aa-278d-4ba5-8a57-8268af92076b' \
--data-urlencode 'grant_type=client_credentials' \
--data-urlencode 'scope=api://ec361fae-7583-4eb0-b80d-2aa504d10f7e/.default' \
--data-urlencode 'client_secret=**' | jq -rc .access_token
set +e
}


bifrost-auth-prd-salesforge-digital () {
set -e
curl -s --connect-timeout 5 --location 'https://login.microsoftonline.com/1236ea7e-8bbc-43a5-a5ee-189a1954e314/oauth2/v2.0/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--header 'Keep-Alive: true' \
--header 'Cookie: fpc=AgefJe7fEi9EjlukBIj9ju60xw3FAwAAAMMHJNwOAAAAC9_FsgEAAABkCCTcDgAAAA; stsservicecookie=estsfd; x-ms-gateway-slice=estsfd; fpc=AgefJe7fEi9EjlukBIj9ju4lK9TRAQAAAJm0eOAOAAAA' \
--data-urlencode 'client_id=3e34cb9a-3081-4140-977d-a111bb0811bc' \
--data-urlencode 'grant_type=client_credentials' \
--data-urlencode 'scope=api://ec361fae-7583-4eb0-b80d-2aa504d10f7e/.default' \
--data-urlencode 'client_secret=**' | jq -rc .access_token
set +e
}

az-get-token () {
  az account get-access-token | jq -rc .accessToken
}

