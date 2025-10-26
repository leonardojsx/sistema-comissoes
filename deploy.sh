#!/bin/bash

echo "🚀 Iniciando processo de deploy..."

# Navegar para o diretório do projeto
cd "$(dirname "$0")"

echo "📦 Preparando backend..."
cd back
npm install
echo "✅ Backend preparado!"

echo "📦 Preparando frontend..."
cd ../front
npm install
npm run build
echo "✅ Frontend buildado!"

echo "🎉 Projeto pronto para deploy!"
echo ""
echo "Próximos passos:"
echo "1. Faça commit e push para seu repositório GitHub"
echo "2. Configure Railway para o backend"
echo "3. Configure Vercel para o frontend"
echo "4. Configure as variáveis de ambiente"