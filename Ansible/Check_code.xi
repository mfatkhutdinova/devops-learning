adrienverage/yamllint .
  Вызов проверки 
    yamllint -c yamllint.yml .

willthames/ansible-lint .
  Вызов проверки .
    ansible-lint --exclude=/path/for/roles -v *.yml .
  ansible-lint обходит роли, но стандартные роли содержит критические варнинги .

syntax-check .
  установить стандартные роли - иначе проверка синтаксиса свалится при упоминании неизвестной роли .
    ansible-galaxy install -t reguirements.yml .
    ansible-playbook playbook.yml --syntax-check .

Все три инструмента можно соединить и засунуть в пайплайн .

Инициализация Molecule .
  Новая роль: .
    molecule init role -r newrole .
  
  Существующая роль: .
    molecule init scenario -r <your_role_name> .
  
  Запуск: .
    molecule test .
    molecule --debug test .
    
  
