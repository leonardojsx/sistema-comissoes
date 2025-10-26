#!/bin/bash

echo "🧪 Testando configurações de produção..."

# Testar se as variáveis estão configuradas
if [ -z "$VITE_API_URL" ]; then
    echo "❌ VITE_API_URL não configurada"
else
    echo "✅ VITE_API_URL: $VITE_API_URL"
fi

# Testar build do frontend
echo "📦 Testando build do frontend..."
cd front
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Build do frontend OK!"
else
    echo "❌ Erro no build do frontend"
    exit 1
fi

echo "🎉 Tudo pronto para produção!"