docker ps -a - список всех контейнеров, которые мы запускали 
docker rm ID - удаляет контейнер по ID 
docker rm $(docker ps -a -q -f status=exited) - удаляет все контейнеры, у которых статус exited


docker pull название_образа - загрузка образа
docker run busybox - запустить контейнер
docker ps - список всех запущенных контейнеров 
docker build — собирает образ
docker logs — смотрим логи
docker stop — останавливает контейнер
docker kill — «убивает» контейнер
docker rm — удаляет контейнер
docker rmi — удаляет образ
docker volume ls — список томов
docker inspect image_name - выводит подробеую инфу об образе 
