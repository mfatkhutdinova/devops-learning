# Ansible Commands

Установка на Ubuntu 16.04:
```
sudo apt-add-repository ppa:ansible/ansible 
sudo apt-get update 
sudo apt-get install ansible 
```

Узнать версию:
```
ansible --version 
```

Проверяет доступность серверов:  
```  
ping
```
 
Спросить пароль для безопасности:  
```
--ask-pass 
```

Показывает все сервера, переменные, которые используются:
```
ansible-inventory --list
```

Показывает все группы, сервера, переменные ввиде графа:
```
ansible-inventory --graph
```

Посмотреть настройки серверов:
```
ansible all -m setup
```

На всех серверах запускаме команду shell:
```
ansible all -m shell –a <комманда> 
```

То же самое, что и shell, только некоторые команды не работают. Он не видит переменные окружения, grep, аутпуты и т.д.:
```  
ansible all -m command -a <команда> 
```

Скопировать файл privet.txt на все сервера в директорию /home. –b означает sudo:
```
ansible all -m copy –a “scr=privet.txt dest=/home mode=777” –b
```

Удалить файл file.txt со всех серверов:
```
ansible all -m file -a “path=/home/file.txt state=absent” -b
```

Скачать, что угодно с интернета на все сервера:
```
ansible all -m get_url –a "url=url dest=/home" -b
```

На все сервера установить программу stress:
```
ansible all –m yym –a "name=stress state=installed" –b
```

Можно ли подконнектиться к сайту?:
```
ansible all –m uri –a "url=https://..." –b
```

Возвращает, что написано на сайте интернета:
```
ansible all –m uri –a "url=https://... return_content=true" –b
```

Установка программ (apache) на всех серверах:
```
  ansible all –m yum –a "name=httpd state=latest" –b
```

Запустить плейбук:
```
ansible-playbook playbook.yml
```


