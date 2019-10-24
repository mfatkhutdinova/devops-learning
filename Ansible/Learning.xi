Обозначения в Ansible .
  vars - переменные .
  tasks - задачи (что нужно делать) .
  handlers - что нужно делать при рестарте. В tasks нужно добавить notify: name handlers .
  debug - при запуске ansible показывает результат .

Блоки и условия .
  В tasks писать when: .
    name: Install Apache Web Server for Debian .
    apt: name=apache2 state=latest .
    when: ansible_os_family == "Debian" .

  Можно использовать блоки, и там один раз испоьзовать условие: .
    block: .
      - name: Install Apache Web Server for Debian .
        apt: name=apache2 state=latest .
    when: ansible_os_family == "Debian" .
  
  Можно использовать until, т.е. делай до тех пор, пока не будет выполнено условие .
    until: .

Циклы .
  Вместо with_items можно использовать слово loop 
  tasks: .
  - name: Say Hello .
    debug: msg = "Hello {{ item }}" .
    with_items: .
      - "Oly" .
      - "Kolya" .
      - "Vasya" .
  with_fileglob - циклы файлов
  
Сохранить результат, который формируется на сервере .
  register: <имя переменной> .

Шаблоны .
  j2 формат .
  template: .

Роли .
  ansible-galaxy init <название роли> .
    tasks - главный лист тасков .
    handlers - все, что должно выполнятся при рестарте .
    defaults - переменные .
    temlates - файлы, которые должны быть генерированы .
    vars - переменные .
    files - файлы, которые должны быть копированы .
    meta - метадата .
    tests - тест .

Внешние переменные .
  --extra-vars .
  --extrf-var .
  -e .
    Пример: ansible-playbook playbook.yml --extra-var "ИМЯПЕРЕМЕННОЙ = ЗНАЧЕНИЕ" .
    Внешние переменные считаются важнее всего .

Import/include .
  include - ansible проходит по файлам и ничего не делает, только при проходе по таскам начинает вставляеть переменные .
  import - ansible проходит по файлам и СРАЗУ все вставляет в плейбук .
    include: название_плейбука .
    import: навание_плейбука .

Добавление в конце дает больше информации при запуске плейбука .
  -v, -vv, -vvv, -vvvv .

Дает понять, что выполнять таск нужно на определенном сервере .
  delegate_to: linux .

Перехват ошибок .
  ignore_errors:yes - игнорирует ошибку в таске .
  failed_when: - можно выбрать, когда будет ошибка, хотя task может отработать без ошибок .
  any_errors_fatal: true - прекратиться выполняться плейбук на всех серверах, если где-то произошла ошибка .

vault .
  ansible-vault encrypt-string - задать зашифровку пароля .
  ansible-playbook playbook.yml ask-vaul-pass .
  
