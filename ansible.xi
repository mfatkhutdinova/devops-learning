Проверяет доступность серверов .
  ping .
Спросить пароль для безопасности .
  --ask-pass .


ansible-inventory --list .  
ansible-inventory --list 
ansible-inventory --graph 


ansible all -m setup  – настройки серверов

ansible all -m shell –a “комманда”

ansible all -m command -a “команда” – то же самое, что и shell, только некоторые команды не работают. Он не видит переменные окружения, grep, аутпуты и т.д.

ansible all -m copy –a “scr=privet.txt dest=/home mode=777” –b 

-b означает, что sudo

ansible all -m file -a “path=/home… state=absent” -b 

Скачать, что угодно с интернета .
  ansible all -m get url –a "url=url dest=/home" -b .

ansible all –m yym –a “name=stress state=installed” –b

ansible all –m uri –a “url=url” –b можно ли подконнектиться к сайту? 

ansible all –m uri –a “url=url return_content=true” –b – возвращает, что написано на сайте интернета

ansible all –m yum –a “name=httpd state=latest” –b – установка вебсайта 

ansible-playbook playbook.yml

extra-vars, extra-var – внешние переменные 

delegate_to – дает понять, что выполнять таск нужно на определенном сервере 
