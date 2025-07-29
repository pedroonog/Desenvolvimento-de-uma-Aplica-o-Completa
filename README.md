# 🛠️ Desenvolvimento de uma Aplicação Completa com Foundry

Este repositório contém uma aplicação Web3 desenvolvida com [Foundry](https://book.getfoundry.sh/), utilizando contratos inteligentes escritos em Solidity, scripts de implantação automatizados e testes.

## 📁 Estrutura do Projeto

\`\`\`
├── script/             # Scripts de implantação com Forge
│   ├── Vault.t.sol     # Script de deploy para o contrato Vault
│   └── .env            # Variáveis de ambiente (NÃO COMITAR)
├── src/                # Contratos inteligentes principais
│   ├── Vault.sol
│   ├── Token.sol
│   └── Counter.sol
├── test/               # Testes automatizados em Solidity
├── foundry.toml        # Configuração do Foundry
├── remappings.txt      # Remapeamento de imports
├── .gitignore
└── README.md
\`\`\`

## 🧪 Tecnologias utilizadas

- [Foundry](https://book.getfoundry.sh/) – framework de desenvolvimento rápido para Ethereum
- Solidity – linguagem para contratos inteligentes
- Alchemy – node provider (usado via RPC)
- GitHub – versionamento de código

## ⚙️ Como rodar localmente

### 1. Clonar o repositório

\`\`\`bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
\`\`\`

### 2. Instalar o Foundry

\`\`\`bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
\`\`\`

### 3. Criar o arquivo \`.env\`

Crie um arquivo \`.env\` dentro da pasta \`/script/\` com as seguintes variáveis:

\`\`\`
PRIVATE_KEY=seu_private_key
RPC_URL=https://seu-endpoint.alchemy.com/v2/...
ETHERSCAN_API_KEY=sua_api_key
\`\`\`

⚠️ **Importante:** Nunca compartilhe seu \`.env\` no GitHub.

### 4. Rodar os testes

\`\`\`bash
forge test -vvv
\`\`\`

### 5. Deploy no Sepolia

\`\`\`bash
forge script script/Vault.t.sol:VaultDeploy --rpc-url \$RPC_URL --broadcast --verify --etherscan-api-key \$ETHERSCAN_API_KEY
\`\`\`

---

## ✅ Objetivos do Projeto

- Criar, testar e publicar contratos inteligentes
- Usar deploy automatizado com scripts em Forge
- Aprender a usar \`.env\` para proteger chaves sensíveis
- Simular ambiente real com deploy na testnet Sepolia

---

## ✍️ Autor

**Pedro Nogueira**  
[GitHub](https://github.com/pedroonog) > README.md
