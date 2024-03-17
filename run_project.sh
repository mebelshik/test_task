#!/bin/bash

# Клонирование репозитория
git clone https://github.com/mebelshik/test_task.git

# Переход в каталог проекта
cd test_task

# Запуск Ansible playbook
sudo ansible-playbook -i hosts playbook.yml
