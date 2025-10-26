# Sistema de Gestão de Comissões e Treinamentos

Sistema web completo para gerenciamento de comissões de vendas e agendamento de treinamentos.

## 📁 Estrutura do Projeto

```
sistema-treinamentos/
├── backend/          # API Node.js + Express
├── frontend/         # React + Vite
├── docs/            # Documentação
├── docker-compose.yml
├── README.md
└── package.json     # Scripts gerais
```

## 🚀 Instalação e Desenvolvimento

### Instalação Completa
```bash
# Instalar dependências de ambos os projetos
npm run install:all

# Ou manualmente:
cd backend && npm install
cd ../frontend && npm install
```

### Desenvolvimento Local
```bash
# Iniciar ambos os serviços simultaneamente
npm run dev

# Ou individualmente:
npm run dev:backend   # Porta 3000
npm run dev:frontend  # Porta 5173
```

## 🛠️ Tecnologias

### Backend
- **Node.js** + Express
- **MySQL** + Knex.js
- **JWT** Authentication
- **CORS** configurado

### Frontend
- **React 19** + Vite
- **Chart.js** para gráficos
- **React Router** para navegação
- **Axios** para API calls
- **React Toastify** para notificações

## 📋 Funcionalidades

- ✅ **Dashboard Analytics** com gráficos de performance
- ✅ **Gestão de Comissões** com cálculos automáticos
- ✅ **Agendamento de Treinamentos** com controle de status
- ✅ **Sistema de Autenticação** JWT
- ✅ **Interface Responsiva** (Mobile + Desktop)
- ✅ **Validações em Tempo Real**
- ✅ **Filtros Avançados** por data e usuário

## 🚀 Deploy

### Opção 1: Railway + Vercel (Recomendada)
- **Backend**: Railway (com MySQL)
- **Frontend**: Vercel

### Opção 2: Docker
```bash
# Build e execução com Docker
docker-compose up --build
```

### Variáveis de Ambiente

#### Backend (.env)
```env
SECRET_JWT=seu_jwt_secret
NODE_ENV=production
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=
DB_NAME=sistema_treinamentos
FRONTEND_URL=http://localhost:5173
```

#### Frontend (.env)
```env
VITE_API_URL=http://localhost:3000
```

## 📚 Documentação

- [Documentação da API](./docs/api.md)
- [Guia de Deploy](./docs/deploy.md)
- [Estrutura do Banco](./docs/database.md)

## 🧪 Testes

```bash
# Executar testes do backend
npm run test:backend

# Executar testes do frontend
npm run test:frontend

# Executar todos os testes
npm run test
```

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

**Desenvolvido com ❤️ para otimizar processos empresariais**