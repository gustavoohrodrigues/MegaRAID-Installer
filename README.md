# MegaRAID CLI Installer – Ubuntu 22.04

Instalador automatizado para o utilitário MegaCLI (Broadcom/LSI), compatível com sistemas baseados em Debian/Ubuntu.

## Funcionalidades

- Verificação e instalação automática de dependências (`wget`, `unzip`, `alien`)
- Download direto do pacote oficial da Broadcom
- Conversão de `.rpm` para `.deb` via `alien`
- Instalação silenciosa e configuração de ambiente (`alias`)

## Como executar

- bash
chmod +x install-megaraid.sh
./install-megaraid.sh

## Observações

-Testado exclusivamente em Ubuntu 22.04.
-O uso de alien pode não ser compatível com distribuições fora do ecossistema Debian.
