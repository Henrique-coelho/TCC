#!/bin/bash
# Verifica se o número de argumentos é válido
json_file="C:\Users\h8men\OneDrive\Documentos\Cefet\TCC\result.json"
log_file="C:\Users\h8men\OneDrive\Documentos\Cefet\TCC\shellErrors.log"
for row in $(jq -r '.[] | .[2]' "${json_file}"); do
    echo "URL encontrada: ${row}"

    # Armazena a URL do repositório GitHub passada como argumento
    github_url=$row
    # Extrai a última parte da URL do GitHub para definir o nome do diretório
    repo_name=$(echo "$github_url" | awk -F'/' '{print $(NF-0)}' | cut -d'.' -f1)

    echo "Clonando o repositório do GitHub $repo_name"
    git clone "$github_url" "$repo_name"

    if [ "$?" -ne 0 ]; then
        echo "Erro ao clonar o repositório do GitHub. ${row}" >> "$log_file"
    fi

    # Executa o comando Java com os parâmetros fornecidos
    metrics_repo='C:\Users\h8men\OneDrive\Documentos\Cefet\TCC\metrics\'
    java -jar ck-0.7.1-SNAPSHOT-jar-with-dependencies.jar "$repo_name" true 0 false "${metrics_repo}${repo_name}"


    echo "Deletando o diretório original: $repo_name"
    rm -rf $repo_name
done
