# Elastic BeansTalk
Elastic BeansTalk - позволяет быстро инфраструктуру для вашего Web-приложения. Обновляет код, включая возврат на предыдущую версию - Rollback.
Есть возможность легко выполнить метод Green/Blue Depoyment.

Поддерживает следующие платформы:  
- Java  
- .Net   
- PHP  
- Node.js  
- Python   
- Ruby   
- GO  
- Docker  

Полная кастомизация через .ebextensions   
.ebextensions - *.config файлы наших настроек в директории .ebextensions  позволяют полную кастомизацию инфраструктуры для Elastic BeansTalk.  
Elastic BeansTalk запускает файлы в алфавитном порядке. Поэтоуимеет смысл номеровать файлы. Например:  
  - 01_create_folders.config 
  - 02_copy_apache_config_files.config
  - 03_...

Группы команд в config файлах:       
packages – скачать и инсталировать программы (yum, rpm, msi)  
sources  - скачать архив из инета и распаковать (tar, gzip, zip)  
files    – создать файлы (можно скачать используя source)  
users    – создать пользователей только на Linux  
groups   – создать группы только на Linux  
commands – запустить системные комманды перед распаковкой zip файла  
container_commands – запустить системные команды после распаковки  
services – стоп, старт сервисов  
Resources – создание дополнительных ресурсов AWS  
