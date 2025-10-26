# 🚂 RAILWAY - Configurações de Deploy

## ✅ Informações para o Railway:

### **Variáveis de Ambiente necessárias:**
```
DB_HOST=viaduct.proxy.rlwy.net
DB_USER=root  
DB_PASSWORD=<senha-gerada-pelo-railway>
DB_DATABASE=railway
JWT_SECRET=AHOIKDUYHAGD86KRT6Y8UY88U
PORT=3001
```

### **Configurações do Projeto:**
- **Runtime**: Node.js
- **Build Command**: `npm install`
- **Start Command**: `npm start`
- **Port**: 3001

### **Passos no Railway:**
1. Criar projeto
2. Adicionar MySQL database
3. Configurar variáveis de ambiente
4. Deploy automático

---

## ⚡ VERCEL - Configurações de Deploy

### **Configurações do Projeto:**
- **Framework**: Vite
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm install`

### **Variável de Ambiente:**
```
VITE_API_URL=https://web-production-xxxx.railway.app
```
*(Usar a URL real que o Railway gerar)*

---

## 🎯 URLs Finais (exemplo):
- **Backend**: `https://sistema-treinamentos-production.railway.app`
- **Frontend**: `https://sistema-treinamentos.vercel.app`