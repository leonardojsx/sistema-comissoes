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