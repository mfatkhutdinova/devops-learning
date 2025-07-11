# Lecture

##### Каталог внутри роли
ansible-galaxy init <название роли>:    
- tasks - в файл main.yml указаны все задачи 
- handlers - в файл main.yml указаны все handlers 
- vars - в файл main.yml указаны все переменные 
- defaults - каталог, в котором указываются значения по умолчанию для переменных. Низкие приоритет 
- meta - каталог, в котором указаны зависимости роли 
- files - каталог, в котором могут находиться различные файлы (файл конфигурации) 
- templates - каталог для шаблонов 

#### Блоки и условия:
В tasks писать when: 
```
name: Install Apache Web Server for Debian 
apt: name=apache2 state=latest 
when: ansible_os_family == "Debian" 
```

Можно использовать блоки, и там один раз испоьзовать условие: 
```
block: 
  - name: Install Apache Web Server for Debian 
    apt: name=apache2 state=latest 
when: ansible_os_family == "Debian" 
```
  
Можно использовать until, т.е. делай до тех пор, пока не будет выполнено условие:
```
until: 
```

#### Циклы 
Вместо with_items можно использовать слово loop:  
```
  tasks: 
  - name: Say Hello 
    debug: msg = "Hello {{ item }}" 
    with_items: 
      - "Oly"
      - "Kolya" 
      - "Vasya" 
  with_fileglob - циклы файлов
```
  
Сохранить результат, который формируется на сервере:   
```
register: <имя переменной> 
```

Вывести на экран: 
```
  debug: 
    msg: "Text" 
```

Шаблоны - j2 формат:
```
template: 
```

Внешние переменные: 
-  --extra-vars 
-  --extrf-var 
-  -e 

Пример:  
```
ansible-playbook playbook.yml --extra-var "ИМЯПЕРЕМЕННОЙ = ЗНАЧЕНИЕ"
```
Внешние переменные считаются важнее всего     

#### Import/include 
-  include - ansible проходит по файлам и ничего не делает, только при проходе по таскам начинает вставляеть переменные 
-  import - ansible проходит по файлам и СРАЗУ все вставляет в плейбук
``` 
include: название_плейбука 
import: навание_плейбука 
```

Добавление в конце дает больше информации при запуске плейбука:
-v, -vv, -vvv, -vvvv 

Дает понять, что выполнять таск нужно на определенном сервере:
```
delegate_to: linux 
```

#### Перехват ошибок
-  ignore_errors:yes - игнорирует ошибку в таске 
-  failed_when: - можно выбрать, когда будет ошибка, хотя task может отработать без ошибок 
-  any_errors_fatal: true - прекратиться выполняться плейбук на всех серверах, если где-то произошла ошибка 

#### Vault
```
ansible-vault encrypt-string - задать зашифровку пароля
ansible-playbook playbook.yml ask-vaul-pass
```
  
#### Фильтры Jinja2
Фильтры для форматирования данных: 
```
{{ var | to_nice_json }} - преобразует данные в формат JSON 
{{ var | to_nice_yaml }} - преобразует данные в формат YAML 
```
 
#### Переменные
```
{{ var | default(9) }} - позволяет определить значение по умолчанию для переменной 
{{ var | default(omit) }} - позволяет пропустить переменную, если она не определена 
```

#### Списки
```
{{ lista | min }} - минимальный элемент списка 
{{ lista | max }} - максимальный элемент списка 
```

Фильтры, которые работают множествами:
```
{{ list1 | unique }} - возвращает множество уникальных элементов из списка
{{ list1 | difference(list2) }} - разница между двумя списками: каких элементов первого списка нет во втором 
```

Фильтр для работы с IP-адресами:
```
{{ var | ipaddr }} - проверяет является ли переменная IP-адресом 
```

Регулярные выражения: 
- regex_replace - замена в строке 
- regex_search - ищет первое совпадение с регулярным выражением 
- regex_findall - ищет все совпадения с регулярным выражением 
  
Фильтры, которые применяют другие фильтры к последовательности объектов:   
```
map: {{ list3 | map('int') }} - применяет другой фильтр к последовательности элементов (например, список)  
```
Также позволяет брать значение определенного атрибута у каждого объекта в списке 
```
select: {{ list4 | select('int') }} - фильтрует последовательность применяя другой фильтр к каждому из элементов
```
Остаются только те объекты, для которых тест отработал  

#### Конвертация типов
```
{{ var | int }} - конвертирует значение в число, по умолчанию, в десятичное 
{{ var | list }} - конвертирует значение в список 
```

#### Ansible собирает такие факты
- ansible_net_all_ipv4_addresses - список IPv4 адресов на устройстве 
- ansible_net_all_ipv6_addresses - список IPv6 адресов на устройстве 
- ansible_net_config - конфигурация (для Cisco sh run) 
- ansible_net_filesystems - файловая система устройства 
- ansible_net_gather_subset - какая информация собирается (hardware, default, interfaces, config) 
- ansible_net_hostname - имя устройства 
- ansible_net_image - имя и путь ОС 
- ansible_net_interfaces - словарь со всеми интерфейсами устройства. Имена интерфейсов - ключи, а данные - параметры каждого интерфейса 
- ansible_net_memfree_mb - сколько свободной памяти на устройстве 
- ansible_net_memtotal_mb - сколько памяти на устройстве 
- ansible_net_model - модель устройства 
- ansible_net_serialnum - серийный номер 
- ansible_net_version - версия IOS 

В выводе видны результаты выполнения задачи, они возвращаются в формате JSON:  
- changed - ключ, который указывает, были ли внесены изменения 
- rc - return code. Это поле появляется в выводе тех модулей, которые выполняют какие-то команды 
- stderr - ошибки при выполнении команды. Это поле появляется в выводе тех модулей, которые выполняют какие-то команды 
- stdout - вывод команды 
- stdout_lines - вывод в виде списка команд, разбитых построчно 
