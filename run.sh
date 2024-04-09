#!/bin/bash

# Временная директория для клонирования репозитория
TEMP_DIR=$(mktemp -d)

# Клонирование репозитория
git clone https://github.com/mebelshik/test_task.git "$TEMP_DIR"

# Переход в директорию проекта
cd "$TEMP_DIR"

# Запуск playbook Ansible
ansible-playbook playbook.yml

# Удаление временной директории (опционально)
rm -rf "$TEMP_DIR"
