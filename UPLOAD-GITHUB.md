# 🚀 Script para subir projeto para GitHub

# IMPORTANTE: Execute estes comandos NA ORDEM, um por vez!

# 1. Inicializar git no projeto
git init

# 2. Adicionar todos os arquivos  
git add .

# 3. Fazer primeiro commit
git commit -m "🎉 feat: Sistema de Treinamentos completo

✨ Features implementadas:
- 🔐 Autenticação JWT completa
- 📊 Dashboard com métricas e gráficos  
- 👥 Gerenciamento de usuários
- 📅 Sistema de agendamento
- 💰 Controle de comissões
- 📱 Interface responsiva
- 🎨 UI moderna glassmorphism

🛠️ Stack técnica:
- Backend: Node.js + Express + MySQL + Knex
- Frontend: React 19 + Vite + Chart.js
- Deploy: Railway + Vercel
- Container: Docker ready

🚀 Pronto para produção!"

# 4. Conectar com o repositório do GitHub (SUBSTITUA pela SUA URL)
git remote add origin https://github.com/SEU-USUARIO/sistema-treinamentos.git

# 5. Subir para o GitHub
git branch -M main
git push -u origin main

# ✅ PRONTO! Projeto no GitHub e pronto para deploy!