# Цвета
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${PURPLE}"
echo "		███╗   ███╗███████╗████████╗██████╗  ██████╗ "
echo "		████╗ ████║██╔════╝╚══██╔══╝██╔══██╗██╔═══██╗"
echo "		██╔████╔██║█████╗     ██║   ██████╔╝██║   ██║"
echo "		██║╚██╔╝██║██╔══╝     ██║   ██╔══██╗██║   ██║"
echo "		██║ ╚═╝ ██║███████╗   ██║   ██║  ██║╚██████╔╝"
echo "		╚═╝     ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ "
echo -e "		${CYAN}             ARCH HYPRLAND SETUP             ${NC}"
echo ""

# Остальная часть скрипта
echo -e "${YELLOW}Добро пожаловать в систему автоматизации.${NC}"
echo "------------------------------------------"
echo -e "Нажми [${GREEN}ENTER${NC}], чтобы начать установку..."
read


show_menu() {
    echo -e "\n${CYAN}>>> ВЫБЕРИТЕ ДЕЙСТВИЕ:${NC}"
    echo -e "${GREEN}1)${NC} Установить полный комплект"
    echo -e "${GREEN}2)${NC} Выход"
    echo -n "Ваш выбор: "
}

install_all() {
    echo -e "\n${GREEN}[1/3] Обновление системы и установка пакетов...${NC}"
    sudo pacman -Syu --needed --noconfirm \
        hyprland waybar rofi-wayland \
        networkmanager network-manager-applet \
        pipewire pipewire-pulse pavucontrol \
        evince base-devel gcc cmake jdk-openjdk neovim \
        git xclip unzip

    echo -e "\n${GREEN}[2/3] Настройка служб...${NC}"
    sudo systemctl enable --now NetworkManager

    echo -e "\n${GREEN}[3/3] Копирование конфигураций...${NC}"
    mkdir -p ~/.config
    cp -r ./hypr ~/.config/ 2>/dev/null
    cp -r ./waybar ~/.config/ 2>/dev/null
    cp -r ./rofi ~/.config/ 2>/dev/null
    cp -r ./nvim ~/.config/ 2>/dev/null

    echo -e "\n${GREEN}=== УСТАНОВКА ЗАВЕРШЕНА ===${NC}"
    echo "Теперь можно перезагрузиться или набрать 'Hyprland'"
}

# Логика меню
show_menu
read choice

case $choice in
    1)
        install_all
        ;;
    2)
        echo "Выход..."
        exit 0
        ;;
    *)
        echo "Неверный пункт. Запусти скрипт снова."
        ;;
esac
