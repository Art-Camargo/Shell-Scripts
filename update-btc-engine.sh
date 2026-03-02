#!/bin/bash
# Carrega as variáveis definidas no .bashrc (inclui $CRIPTO)
source "$HOME/.bashrc"
# Nome da imagem usada
IMAGE_NAME="btc-engine"

# Caminho onde está o Dockerfile e o projeto
PROJECT_DIR="$HOME/Desktop/ideas/go-currency"

# Encontra o ID do container rodando com essa imagem
CONTAINER_ID=$(docker ps -q --filter ancestor=$IMAGE_NAME)

# Para e remove o container, se existir
if [ -n "$CONTAINER_ID" ]; then
  echo "Parando e removendo container com ID $CONTAINER_ID baseado em $IMAGE_NAME..."
  docker stop "$CONTAINER_ID"
  docker rm "$CONTAINER_ID"
else
  echo "Nenhum container rodando com imagem $IMAGE_NAME foi encontrado."
fi

# Vai até o diretório do projeto antes de buildar
echo "Indo até o diretório do projeto: $PROJECT_DIR"
cd "$PROJECT_DIR" || { echo "Erro ao entrar no diretório $PROJECT_DIR"; exit 1; }

# Reconstrói a imagem
echo "Construindo imagem $IMAGE_NAME..."
docker build -t $IMAGE_NAME .

# Executa o comando que recria o container
echo "Executando comando $CRIPTO para recriar o container..."
bash "$HOME/scripts/shell-scripts/crypto.sh"

