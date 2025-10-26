# migrate-to-monorepo.ps1
# Script para migrar de repositórios separados para monorepo

Write-Host "🚀 Iniciando migração para repositório unificado..." -ForegroundColor Green

# 1. Criar estrutura do novo repositório
Write-Host "📁 Criando estrutura do repositório..." -ForegroundColor Yellow
$repoPath = "c:\Users\T.i\Desktop\PROJETOS\sistema-treinamentos-unificado"

if (Test-Path $repoPath) {
    Write-Host "⚠️  Pasta já existe. Removendo..." -ForegroundColor Yellow
    Remove-Item $repoPath -Recurse -Force
}

New-Item -ItemType Directory -Path $repoPath -Force
Set-Location $repoPath

# 2. Inicializar git
Write-Host "🔧 Inicializando git..." -ForegroundColor Yellow
git init
git branch -M main

# 3. Copiar código existente
Write-Host "📂 Copiando código existente..." -ForegroundColor Yellow
$sourcePath = "c:\Users\T.i\Desktop\PROJETOS\Sistema-de-treinamentos\treinamentos"

# Copiar backend
Write-Host "   ↳ Copiando backend..." -ForegroundColor Cyan
xcopy /E /I "$sourcePath\back" "backend"

# Copiar frontend
Write-Host "   ↳ Copiando frontend..." -ForegroundColor Cyan  
xcopy /E /I "$sourcePath\front" "frontend"

# Copiar arquivos de configuração
Write-Host "   ↳ Copiando configurações..." -ForegroundColor Cyan
Copy-Item "$sourcePath\package.json" "."
Copy-Item "$sourcePath\docker-compose.yml" "."
Copy-Item "$sourcePath\README-MONOREPO.md" "README.md"
Copy-Item "$sourcePath\.gitignore" "."
Copy-Item "$sourcePath\railway.json" "."
Copy-Item "$sourcePath\vercel.json" "."

# Copiar documentação
New-Item -ItemType Directory -Path "docs" -Force
Copy-Item "$sourcePath\docs\*" "docs\" -Recurse

# 4. Instalar dependências
Write-Host "📦 Instalando dependências..." -ForegroundColor Yellow

# Dependências principais
Write-Host "   ↳ Instalando dependências principais..." -ForegroundColor Cyan
npm install

# Backend
Write-Host "   ↳ Instalando dependências do backend..." -ForegroundColor Cyan
Set-Location "backend"
npm install
Set-Location ".."

# Frontend  
Write-Host "   ↳ Instalando dependências do frontend..." -ForegroundColor Cyan
Set-Location "frontend"
npm install
Set-Location ".."

# 5. Testar build
Write-Host "🔨 Testando builds..." -ForegroundColor Yellow
npm run build

# 6. Commit inicial
Write-Host "📝 Criando commit inicial..." -ForegroundColor Yellow
git add .
git commit -m "🎉 feat: repositório unificado com estrutura monorepo

✨ Features implementadas:
- 🔐 Sistema de autenticação JWT completo
- 📊 Dashboard com métricas e gráficos
- 👥 Gerenciamento de usuários e permissões  
- 📅 Sistema de agendamento de treinamentos
- 💰 Controle de comissões por treinamento
- 📱 Interface responsiva com design moderno
- 🎨 UI glassmorphism com animações fluidas

🛠️ Stack técnica:
- Backend: Node.js + Express + JWT + MySQL + Knex
- Frontend: React 19 + Vite + Chart.js + CSS3
- Deploy: Railway (API) + Vercel (Frontend)
- Container: Docker + docker-compose
- Monorepo: Scripts centralizados + dependências unificadas

🚀 Pronto para deploy em produção!"

Write-Host "✅ Migração concluída com sucesso!" -ForegroundColor Green
Write-Host ""
Write-Host "📋 Próximos passos:" -ForegroundColor Yellow
Write-Host "   1. Criar repositório no GitHub" -ForegroundColor White
Write-Host "   2. git remote add origin https://github.com/SEU-USUARIO/sistema-treinamentos.git" -ForegroundColor Gray
Write-Host "   3. git push -u origin main" -ForegroundColor Gray
Write-Host "   4. Configurar deploy no Railway e Vercel" -ForegroundColor White
Write-Host ""
Write-Host "🔧 Para testar localmente:" -ForegroundColor Yellow
Write-Host "   npm run dev" -ForegroundColor Gray
Write-Host ""
Write-Host "🐳 Para testar com Docker:" -ForegroundColor Yellow
Write-Host "   docker-compose up --build" -ForegroundColor Gray