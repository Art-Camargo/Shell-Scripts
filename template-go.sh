#!/bin/bash


PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Uso: TMPLWEBAPIGO nome-do-projeto"
  exit 1
fi

mkdir $PROJECT_NAME

mkdir "$PROJECT_NAME/internal"

cp -r "$WEBAPICLIGO/"* "$PROJECT_NAME/internal/"

cd "$PROJECT_NAME" || exit

go mod init "$PROJECT_NAME"

go mod tidy

echo "✅ Projeto criado com sucesso!"
echo ""
echo "Próximos passos:"
echo "cd $PROJECT_NAME"
echo "go run main.go"
