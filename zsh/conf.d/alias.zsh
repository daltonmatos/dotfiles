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

az-get-token () {
  az account get-access-token | jq -rc .accessToken
}

