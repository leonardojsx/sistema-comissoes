# Sistema de Gestão de Comissões e Treinamentos

Sistema web completo para gerenciamento de comissões de vendas e agendamento de treinamentos.

## 🚀 Deploy em Produção

### Backend (Railway)

1. **Criar conta no Railway**: https://railway.app
2. **Conectar repositório GitHub**
3. **Configurar variáveis de ambiente**:
   ```env
   SECRET_JWT=seu_jwt_secret_aqui
   NODE_ENV=production
   DB_HOST=seu_host_mysql
   DB_PORT=3306
   DB_USER=seu_usuario
   DB_PASSWORD=sua_senha
   DB_NAME=sistema_treinamentos
   FRONTEND_URL=https://seu-frontend.vercel.app
   ```
4. **Deploy automático** será feito após o push

### Frontend (Vercel)

1. **Criar conta no Vercel**: https://vercel.com
2. **Conectar repositório GitHub**
3. **Configurar variáveis de ambiente**:
   ```env
   VITE_API_URL=https://seu-backend.railway.app
   ```
4. **Deploy automático** será feito após o push

### Banco de Dados MySQL

Recomendo usar o **PlanetScale** (gratuito) ou **Railway MySQL**:

1. Criar database MySQL
2. Executar migrations: `npm run migrate` no backend
3. Configurar credenciais nas variáveis de ambiente

## 🛠️ Desenvolvimento Local

### Backend
```bash
cd back
npm install
npm start
```

### Frontend
```bash
cd front
npm install
npm run dev
```

## 📋 Funcionalidades

- ✅ Gestão de Comissões
- ✅ Agendamento de Treinamentos
- ✅ Dashboard com Analytics
- ✅ Sistema de Autenticação
- ✅ Interface Responsiva
- ✅ Validações em Tempo Real

## 🏗️ Tecnologias

- **Frontend**: React 19, Vite, Chart.js
- **Backend**: Node.js, Express, JWT
- **Database**: MySQL, Knex.js
- **Deploy**: Vercel + Railway