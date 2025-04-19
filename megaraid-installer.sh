#!/bin/bash
# Instalador MegaRAID para Ubuntu 22.04
# Descrição: Instalação automatizada das ferramentas de linha de comando MegaRAID
# Autor: Gustavo H.
# Versão: 1.2
# Licença: MIT

set -euo pipefail  # Encerra o script em caso de erro ou variável indefinida

# Cores para a saída
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sem cor

echo -e "${YELLOW}=== Instalação do MegaRAID Controller ===${NC}"

# Confirmação do usuário
read -p "Digite 1 para prosseguir com o script, ou 0 para cancelar: " escolha
if [ "$escolha" -ne 1 ]; then
    echo -e "${RED}Execução cancelada.${NC}"
    exit 1
fi

# Verificação de dependências
echo -e "${YELLOW}Verificando dependências...${NC}"
dependencies=("wget" "unzip" "alien")
for dep in "${dependencies[@]}"; do
    if ! command -v "$dep" &> /dev/null; then
        echo -e "${YELLOW}Instalando $dep...${NC}"
        sudo apt-get update > /dev/null
        sudo apt-get install -y "$dep" > /dev/null
    fi
done

# Download e extração
echo -e "${YELLOW}Baixando MegaCLI...${NC}"
MEGA_CLI_URL="https://docs.broadcom.com/docs-and-downloads/raid-controllers/raid-controllers-common-files/8-07-14_MegaCLI.zip"
MEGA_CLI_ZIP="8-07-14_MegaCLI.zip"

if [ ! -f "$MEGA_CLI_ZIP" ]; then
    wget -q --show-progress "$MEGA_CLI_URL"
fi

echo -e "${YELLOW}Extraindo arquivos...${NC}"
unzip -q "$MEGA_CLI_ZIP" -d MegaRAID_Package
cd MegaRAID_Package/Linux || exit

# Remoção de arquivos desnecessários
echo -e "${YELLOW}Limpando arquivos desnecessários...${NC}"
rm -rf ../{DOS,FreeBSD,Solaris,Windows,uploads,cache,files}

# Conversão e instalação do pacote
echo -e "${YELLOW}Convertendo e instalando pacote...${NC}"
sudo alien -q MegaCli-8.07.14-1.noarch.rpm
sudo dpkg -i megacli_8.07.14-2_all.deb > /dev/null

# Configuração do ambiente
echo -e "${YELLOW}Configurando ambiente...${NC}"
echo "alias MegaCli64='/opt/MegaRAID/MegaCli/MegaCli64'" >> ~/.bashrc
source ~/.bashrc

# Verificação final
if command -v MegaCli64 &> /dev/null; then
    echo -e "${GREEN}Instalação concluída com sucesso!${NC}"
    echo -e "Use o comando MegaCli64 para acessar o utilitário."
    echo -e "Exemplo: MegaCli64 -LDInfo -Lall -aALL"
else
    echo -e "${RED}Falha na instalação. Verifique os logs.${NC}"
    exit 1
fi
