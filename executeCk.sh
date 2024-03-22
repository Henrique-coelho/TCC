#!/bin/bash

# Verifica se o número de argumentos é válido
if [ "$#" -ne 1 ]; then
    echo "Uso: $0 <diretório_do_projeto>"
    exit 1
fi

# Armazena o diretório do projeto passado como argumento
projeto_dir="$1"

# Executa o comando Java com os parâmetros fornecidos
java -jar ck-0.7.1-SNAPSHOT-jar-with-dependencies.jar "$projeto_dir" true 0 False "C:\Users\h8men\OneDrive\Documentos\Cefet\TCC\metrics"
