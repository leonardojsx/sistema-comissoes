# 🚀 CHECKLIST DEPLOY - Seu Primeiro Deploy

## ✅ ETAPA 1: Preparação Inicial

### 1.1 - Testar Local ✅
```powershell
# Backend
cd c:\Users\T.i\Desktop\PROJETOS\Sistema-de-treinamentos\treinamentos\back
npm install
npm start
# ✅ Deve mostrar: "Servidor rodando na porta 3001"

# Frontend (novo terminal)
cd c:\Users\T.i\Desktop\PROJETOS\Sistema-de-treinamentos\treinamentos\front
npm install  
npm run dev
# ✅ Deve abrir: http://localhost:5173
```

### 1.2 - Configurações OK ✅
- ✅ Backend: package.json configurado
- ✅ Frontend: package.json configurado  
- ✅ API: axios configurado para variáveis de ambiente
- ✅ Arquivos .env.example criados

---

## 🚂 ETAPA 2: Deploy Backend (Railway)

### 2.1 - Criar conta Railway
1. 🌐 Acessar: [railway.app](https://railway.app)
2. 🔑 **"Start a New Project"** → Login com GitHub
3. ✅ **Grátis**: 500 horas/mês

### 2.2 - Criar projeto
1. **"New Project"** → **"Deploy from GitHub repo"**
2. Conectar repositório (ou fazer upload do código)
3. Railway detecta Node.js automaticamente
4. **"Deploy"**

### 2.3 - Adicionar MySQL
1. No projeto → **"+ New"** → **"Database"** → **"Add MySQL"**
2. ⏱️ Aguardar criação (2-3 minutos)
3. 📝 Copiar credenciais do banco

### 2.4 - Configurar Variáveis
Em **"Variables"** do seu serviço:

```
DB_HOST=viaduct.proxy.rlwy.net (ou similar)
DB_USER=root
DB_PASSWORD=senha-gerada-pelo-railway
DB_DATABASE=railway  
JWT_SECRET=MeuSuperSecretoJWT2024!@#
PORT=3001
```

### 2.5 - Executar Migrations
```bash
# No Railway, pode executar via "Deploy Logs"
# ou adicionar script no package.json:
"scripts": {
  "start": "npm run migrate && node server.js",
  "migrate": "knex migrate:latest"
}
```

### ✅ Resultado: Backend funcionando
URL exemplo: `https://web-production-xxxx.railway.app`

---

## ⚡ ETAPA 3: Deploy Frontend (Vercel)

### 3.1 - Criar conta Vercel  
1. 🌐 Acessar: [vercel.com](https://vercel.com)
2. 🔑 **"Sign Up"** → Login com GitHub
3. ✅ **Totalmente grátis!**

### 3.2 - Deploy do Frontend
1. **"New Project"** → Selecionar repositório
2. **Framework**: Vite (detecta automático)
3. **Build Command**: `npm run build` ✅
4. **Output Directory**: `dist` ✅  
5. **Install Command**: `npm install` ✅
6. **"Deploy"**

### 3.3 - Configurar Variável
1. **"Settings"** → **"Environment Variables"**
2. Adicionar:
```
Name: VITE_API_URL
Value: https://web-production-xxxx.railway.app
```
*Use a URL real do seu Railway*

### 3.4 - Redeploy
Após adicionar variável → **"Redeploy"**

### ✅ Resultado: Frontend funcionando  
URL exemplo: `https://sistema-treinamentos.vercel.app`

---

## 🔧 ETAPA 4: Conectar Frontend + Backend

### 4.1 - Atualizar CORS (Backend)
No arquivo `back/app.js` ou `back/server.js`:

```javascript
import cors from 'cors';

app.use(cors({
  origin: [
    'http://localhost:5173',                    // desenvolvimento
    'https://sistema-treinamentos.vercel.app'  // produção - SUA URL
  ],
  credentials: true
}));
```

### 4.2 - Fazer novo deploy do backend
Após alterar CORS → **commit + push** → Railway redeploya automaticamente

---

## 🧪 ETAPA 5: Testes Finais

### ✅ Checklist de Funcionamento

1. **Backend Live**:
   - 🌐 Acessar: `https://sua-url-railway.app`
   - ✅ Deve carregar algo (mesmo que erro 404 é OK)

2. **Frontend Live**:  
   - 🌐 Acessar: `https://sua-url-vercel.app`
   - ✅ Deve carregar tela de login

3. **Integração Funcionando**:
   - 🔑 Fazer login no frontend
   - ✅ Deve conectar com backend
   - ✅ Sem erros de CORS no console

4. **Banco Funcionando**:
   - 👤 Tentar cadastrar usuário
   - 🔑 Fazer login
   - ✅ Dados devem persistir

---

## 🎉 PARABÉNS! 

### 🌐 Suas URLs Finais:
- **Frontend**: `https://_____.vercel.app`
- **Backend**: `https://_____.railway.app`  
- **Acesso**: Qualquer pessoa pode acessar!

### 📱 O que você conquistou:
- ✅ Aplicação na internet 24/7
- ✅ HTTPS seguro automático
- ✅ Acesso global (CDN)
- ✅ Auto-deploy (push no GitHub = atualização)
- ✅ Monitoramento incluído
- ✅ **Completamente GRÁTIS!**

---

## 🆘 Problemas Comuns

### ❌ "Cannot connect to database"
**Solução**: Verificar variáveis no Railway

### ❌ "CORS policy error"  
**Solução**: Adicionar URL do Vercel no CORS

### ❌ "Network Error" no frontend
**Solução**: Verificar `VITE_API_URL` no Vercel

### ❌ "Application failed to respond"
**Solução**: Ver logs no Railway → Deployments

---

**🚀 Pronto para começar? Vamos fazer juntos!**