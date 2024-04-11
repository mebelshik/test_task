#!/bin/bash

# Временная директория для клонирования репозитория
TEMP_DIR=$(mktemp -d) || exit 1

# Клонирование репозитория
git clone https://github.com/mebelshik/test_task.git "$TEMP_DIR" || exit 1

# Переход в директорию проекта
cd "$TEMP_DIR" || exit 1

# Запуск playbook Ansible
ansible-playbook playbook.yml || exit 1

# Удаление временной директории (опционально)
rm -rf "$TEMP_DIR"
