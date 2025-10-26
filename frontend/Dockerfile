FROM node:18-alpine

WORKDIR /app

# Copiar package.json
COPY package*.json ./

# Instalar dependências
RUN npm ci --only=production

# Copiar código da aplicação
COPY . .

# Build da aplicação
RUN npm run build

# Instalar serve para servir arquivos estáticos
RUN npm install -g serve

# Expor porta
EXPOSE 5173

# Comando para servir a aplicação
CMD ["serve", "-s", "dist", "-l", "5173"]