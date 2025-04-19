# MegaRAID ToolKit – Ubuntu 22.04

Instalador automatizado para o utilitário MegaCLI (Broadcom/LSI), compatível com sistemas baseados em Debian/Ubuntu.

## Funcionalidades

- Verificação e instalação automática de dependências (`wget`, `unzip`, `alien`)
   
- Download direto do pacote oficial da Broadcom
  
- Conversão de `.rpm` para `.deb` via `alien`
  
- Instalação silenciosa e configuração de ambiente (`alias`)

## Como executar


sudo chmod +x install-megaraid.sh

./install-megaraid.sh


# 🛠️ Gerenciamento MegaRAID Interativo

Após feita a instalação, execute o gerenciador da controladora com o comando:

- sudo ./scripts/manager.sh


Caso veja erro de permissão, execute:

- chmod +x ./scripts/manager.sh


# Opções Disponiveis: 

| Opção | Descrição                       | Comando equivalente                     |
|:-----:|---------------------------------|-----------------------------------------|
| 1     | Lista discos físicos            | `MegaCli64 -PDList -aALL`               |
| 2     | Verifica armazenamento total    | `MegaCli64 -LDInfo -Lall -aALL`         |
| 3     | Estado dos arrays               | `MegaCli64 -ShowSummary -aALL`          |
| 4     | Informações completas do RAID   | `MegaCli64 -AdpAllInfo -aALL`           |
| 5     | Visualiza logs da controladora  | `MegaCli64 -FwTermLog -Dsply -aALL`     |

## Observações

-Testado exclusivamente em Ubuntu 22.04.

-O uso de alien pode não ser compatível com distribuições fora do ecossistema Debian.




