Обозначения в Ansible .
  vars - переменные .
  tasks - задачи (что нужно делать) .
  handlers - что нужно делать при рестарте. В tasks нужно добавить notify: name handlers .

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