docker ps -a - список всех контейнеров, которые мы запускали 
docker rm ID - удаляет контейнер по ID 
docker rm $(docker ps -a -q -f status=exited) - удаляет все контейнеры, у которых статус exited

Команды для управления контейнерами:
docker container my_command .
docker create — создание контейнера из образа.
docker start — запуск существующего контейнера.
docker run — создание контейнера и его запуск.
docker ls — вывод списка работающих контейнеров.
docker inspect — вывод подробной информации о контейнере.
docker logs — вывод логов.
docker stop — остановка работающего контейнера с отправкой главному процессу контейнера сигнала SIGTERM, и, через некоторое время, SIGKILL.
docker kill — остановка работающего контейнера с отправкой главному процессу контейнера сигнала SIGKILL.
docker rm — удаление остановленного контейнера.


Команды для управления образами:
docker image my_command .
docker build — сборка образа.
docker push — отправка образа в удалённый реестр.
docker ls — вывод списка образов.
docker history — вывод сведений о слоях образа.
docker inspect — вывод подробной информации об образе, в том числе — сведений о слоях.
docker rm — удаление образа.
docker rmi — удаляет образ

Другие команды: 
docker pull название_образа - загрузка образа
docker ps - список всех запущенных контейнеров 
docker volume ls — список томов
docker container ls -s - узнавать размеры образов и контейнеров Docker
docker version — вывод сведений о версиях клиента и сервера Docker. 
docker network ls - вывод network

Команда, которая позволяет быстро остановить все работающие контейнеры:
docker container kill $(docker ps -q) 

docker volume create —-name my_volume - создание тома 
docker volume ls - просмотреть список томов Docker
docker volume rm my_volume - удаление тома 
docker volume prune - удалить все тома


docker run -v /opt/data:/var/lib/mysql -d --name=mysql-db -e MYSQL_ROOT_PASSWORD=db_pass123 mysql
