# 🚀 SEU PRIMEIRO DEPLOY - Guia Completo para Iniciantes

## 🎯 O que é Deploy?

**Deploy** = Colocar sua aplicação na internet para outras pessoas acessarem!

- 💻 **Agora**: Só funciona no seu computador (`localhost:3000`)
- 🌐 **Depois**: Qualquer pessoa acessa via URL na internet

## 📋 Plano de Deploy

Vamos usar as **melhores plataformas gratuitas**:

- 🚂 **Railway** → Para o Backend (API)
- ⚡ **Vercel** → Para o Frontend (Interface)
- 🗄️ **MySQL** → Banco de dados (Railway fornece grátis)

## 🛠️ PASSO 1: Preparar o Projeto

### ✅ **1.1 - Verificar se tudo funciona localmente**

```powershell
# Testar se está tudo funcionando
cd "c:\Users\T.i\Desktop\PROJETOS\Sistema-de-treinamentos\treinamentos"

# Rodar backend
cd back
npm install
npm start
# Deve aparecer: "Servidor rodando na porta 3001"

# Em outro terminal - rodar frontend
cd ..\front  
npm install
npm run dev
# Deve abrir: http://localhost:5173
```

### ✅ **1.2 - Criar arquivo de configuração para produção**

**Arquivo: `back/.env.example`** (para mostrar quais variáveis são necessárias)
```env
# Exemplo das variáveis necessárias
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_DATABASE=treinamentos
JWT_SECRET=seu-jwt-secret-aqui
PORT=3001
```

### ✅ **1.3 - Verificar package.json do backend**

Vamos conferir se tem o script de start correto:

```json
{
  "scripts": {
    "start": "node app.js",
    "dev": "nodemon app.js"
  }
}
```

## 🚂 PASSO 2: Deploy do Backend no Railway

### **2.1 - Criar conta no Railway**

1. Acesse: [railway.app](https://railway.app)
2. Clique em **"Start a New Project"**
3. Faça login com GitHub
4. **É GRÁTIS!** (500 horas/mês)

### **2.2 - Criar projeto no Railway**

1. **"New Project"** → **"Deploy from GitHub repo"**
2. Conectar seu repositório do backend
3. Railway detecta automaticamente que é Node.js
4. Clique em **"Deploy"**

### **2.3 - Configurar Banco de Dados**

1. No projeto Railway → **"+ New"** → **"Database"** → **"Add MySQL"**
2. Railway cria banco automaticamente
3. Copie as credenciais (vamos usar no próximo passo)

### **2.4 - Configurar Variáveis de Ambiente**

1. Vá em **"Variables"** no seu serviço
2. Adicione cada variável:

```
DB_HOST=seu-mysql-host-do-railway
DB_USER=root  
DB_PASSWORD=senha-gerada-pelo-railway
DB_DATABASE=railway
JWT_SECRET=meuSuperSecretoJWT2024!
PORT=3001
```

### **2.5 - Executar Migrations**

No Railway, vá em **"Deployments"** → **"View Logs"** para acompanhar o deploy.

## ⚡ PASSO 3: Deploy do Frontend no Vercel

### **3.1 - Criar conta no Vercel**

1. Acesse: [vercel.com](https://vercel.com)
2. **"Sign Up"** → Login com GitHub
3. **Totalmente grátis!**

### **3.2 - Fazer deploy**

1. **"New Project"** → Selecionar repositório do frontend
2. **Framework Preset**: Vite
3. **Build Command**: `npm run build`
4. **Output Directory**: `dist`
5. **Install Command**: `npm install`

### **3.3 - Configurar variável de ambiente**

1. **"Settings"** → **"Environment Variables"**
2. Adicionar:
```
VITE_API_URL=https://seu-backend.railway.app
```

**⚠️ IMPORTANTE**: Pegar a URL do Railway (algo como `https://web-production-xxxx.railway.app`)

### **3.4 - Fazer redeploy**

Após adicionar a variável, clique em **"Redeploy"** para aplicar.

## 🔧 PASSO 4: Configurar URLs nos Códigos

### **4.1 - Atualizar CORS no Backend**

No arquivo `back/app.js`, atualizar o CORS:

```javascript
// Permitir acesso do frontend em produção
app.use(cors({
  origin: [
    'http://localhost:5173',           // desenvolvimento
    'https://seu-app.vercel.app'       // produção
  ],
  credentials: true
}));
```

### **4.2 - Criar arquivo .env no frontend**

**Arquivo: `front/.env`**
```env
VITE_API_URL=https://seu-backend.railway.app
```

**Arquivo: `front/.env.local`** (para desenvolvimento)
```env
VITE_API_URL=http://localhost:3001
```

## 🧪 PASSO 5: Testar o Deploy

### **✅ Checklist de Testes**

1. **Backend funcionando**:
   - Acessar: `https://seu-backend.railway.app/health`
   - Deve retornar: `{"status": "OK"}`

2. **Frontend funcionando**:
   - Acessar: `https://seu-app.vercel.app`
   - Deve carregar a tela de login

3. **Integração funcionando**:
   - Fazer login no frontend
   - Deve conectar com o backend

4. **Banco de dados funcionando**:
   - Cadastrar um usuário
   - Fazer login
   - Verificar se salva no banco

## 🎯 URLs Finais do Projeto

Após o deploy, você terá:

- 🌐 **Frontend**: `https://sistema-treinamentos.vercel.app`
- 🔗 **Backend**: `https://sistema-treinamentos.railway.app`
- 📱 **Acesso Móvel**: Funciona em qualquer celular!

## 🆘 Resolução de Problemas Comuns

### **❌ Erro: "Cannot connect to database"**
**Solução**: Verificar variáveis de ambiente no Railway

### **❌ Erro: "CORS policy"**  
**Solução**: Adicionar URL do Vercel no CORS do backend

### **❌ Frontend carrega, mas não conecta com API**
**Solução**: Verificar `VITE_API_URL` no Vercel

### **❌ "Application failed to respond"**
**Solução**: Verificar logs no Railway → Deployments

## 🎉 Próximos Passos Após Deploy

1. **📱 Testar em diferentes dispositivos**
2. **🔧 Configurar domínio personalizado** (opcional)
3. **📊 Monitorar performance** nas plataformas
4. **🚀 Compartilhar com amigos e empregadores!**

## 💡 Dicas Importantes

- **✅ Deploy é gratuito** nas duas plataformas
- **🔄 Auto-deploy**: Qualquer push no GitHub atualiza automaticamente
- **📱 HTTPS automático**: Seus sites são seguros por padrão
- **⚡ CDN global**: Sites carregam rápido no mundo todo
- **📊 Analytics inclusos**: Veja quantas pessoas acessam

---

**🎯 Agora vamos fazer juntos, passo a passo!**

Quer começar? Me avise e vou te guiar em cada etapa! 🚀