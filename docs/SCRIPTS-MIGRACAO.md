# 🚀 Scripts de Migração - Sistema de Treinamentos

## 📦 Script PowerShell para Migração Completa

```powershell
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
```

## 🔥 Script de Deploy Automatizado

```powershell
# deploy.ps1
# Script para deploy automatizado

Write-Host "🚀 Iniciando deploy automático..." -ForegroundColor Green

# 1. Build de produção
Write-Host "🔨 Executando build de produção..." -ForegroundColor Yellow
npm run build

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erro no build. Abortando deploy." -ForegroundColor Red
    exit 1
}

# 2. Testes básicos
Write-Host "🧪 Executando testes..." -ForegroundColor Yellow
npm run test:quick

# 3. Commit e push
Write-Host "📝 Commitando alterações..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git add .
git commit -m "🚀 deploy: atualização de produção - $timestamp"
git push origin main

# 4. Deploy Railway (Backend)
Write-Host "🚂 Fazendo deploy do backend no Railway..." -ForegroundColor Yellow
# Railway faz deploy automático via webhook do GitHub

# 5. Deploy Vercel (Frontend)  
Write-Host "⚡ Fazendo deploy do frontend no Vercel..." -ForegroundColor Yellow
# Vercel faz deploy automático via webhook do GitHub

Write-Host "✅ Deploy concluído!" -ForegroundColor Green
Write-Host ""
Write-Host "🌐 URLs de produção:" -ForegroundColor Yellow
Write-Host "   Frontend: https://sistema-treinamentos.vercel.app" -ForegroundColor Cyan
Write-Host "   Backend:  https://sistema-treinamentos.railway.app" -ForegroundColor Cyan
```

## 📋 Script de Verificação

```powershell
# verify.ps1
# Script para verificar se tudo está funcionando

Write-Host "🔍 Verificando estrutura do projeto..." -ForegroundColor Green

# Verificar arquivos essenciais
$essentialFiles = @(
    "package.json",
    "docker-compose.yml", 
    "README.md",
    ".gitignore",
    "railway.json",
    "vercel.json",
    "backend\package.json",
    "backend\app.js",
    "frontend\package.json", 
    "frontend\index.html",
    "docs\REPOSITORIO-UNIFICADO.md"
)

foreach ($file in $essentialFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file" -ForegroundColor Red
    }
}

# Verificar dependências
Write-Host "`n📦 Verificando dependências..." -ForegroundColor Yellow
npm list --depth=0

# Testar scripts
Write-Host "`n🧪 Testando scripts principais..." -ForegroundColor Yellow
Write-Host "   ↳ npm run build" -ForegroundColor Cyan
npm run build

Write-Host "`n✅ Verificação concluída!" -ForegroundColor Green
```

## 🎯 Como Usar os Scripts

### 1. **Salvar Scripts**
```powershell
# Criar pasta de scripts
mkdir scripts
```

### 2. **Executar Migração**
```powershell
# Dar permissão (se necessário)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Executar migração
.\scripts\migrate-to-monorepo.ps1
```

### 3. **Verificar Resultado**
```powershell
.\scripts\verify.ps1
```

### 4. **Deploy Automático**
```powershell
.\scripts\deploy.ps1
```

---

*Scripts para facilitar a migração e deploy do Sistema de Treinamentos* 🛠️