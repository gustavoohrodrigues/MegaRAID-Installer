#!/bin/bash
# MegaRAID Management Tool v1.0
# Author: Gustavo Henrique Rodrigues
# License: MIT

# Cores para feedback visual
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Caminho do executável
MEGACLI="/opt/MegaRAID/MegaCli/MegaCli64"

# Verifica se o MegaCli está instalado
verify_installation() {
    if [ ! -x "$MEGACLI" ]; then
        echo -e "${RED}Erro: MegaCli64 não encontrado!${NC}"
        echo -e "Execute primeiro o script de instalação."
        exit 1
    fi
}

# Função para exibir o menu
show_menu() {
    clear
    echo -e "${YELLOW}=== Gerenciamento MegaRAID ==="
    echo -e "${GREEN}1. Listar todos os discos físicos"
    echo "2. Verificar armazenamento total"
    echo "3. Verificar estado dos arrays"
    echo "4. Informações completas de RAID"
    echo "5. Visualizar logs da controladora"
    echo -e "6. Sair${NC}"
    echo "=============================="
}

# Função principal
main() {
    verify_installation

    while true; do
        show_menu
        read -p "Escolha uma opção: " choice

        case $choice in
            1)
                echo -e "\n${YELLOW}# Listando discos físicos:${NC}"
                $MEGACLI -PDList -aALL
                ;;
            2)
                echo -e "\n${YELLOW}# Verificando armazenamento:${NC}"
                $MEGACLI -LDInfo -Lall -aALL
                ;;
            3)
                echo -e "\n${YELLOW}# Estado dos arrays:${NC}"
                $MEGACLI -ShowSummary -aALL
                ;;
            4)
                echo -e "\n${YELLOW}# Informações de RAID:${NC}"
                $MEGACLI -AdpAllInfo -aALL
                ;;
            5)
                echo -e "\n${YELLOW}# Logs da controladora:${NC}"
                $MEGACLI -FwTermLog -Dsply -aALL
                ;;
            6)
                echo -e "${GREEN}Saindo...${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Opção inválida!${NC}"
                ;;
        esac

        read -p "Pressione Enter para continuar..."
    done
}

main
