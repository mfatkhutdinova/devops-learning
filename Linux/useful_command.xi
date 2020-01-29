scp -r zeppelin@m1-zeppelin01p:/opt/app/zeppelin_cmn/helium-repo zeppelin_fnr/
tail somefile - читает заданный в качестве аргумента файл и выводит его последнюю часть («хвост»)
head somefile - читает заданный в качестве аргумента файл и выводит его первую часть 
wget someurl - ПО для скачивания файлов через HTTP, HTTPS, FTP и FTPS —

cat /var/log/dmesg - информация о загрузке 
dmesg - все сообщения ядра 
pstree - дерево всех запущенных процессов 

journalctl -u zeppelin@cmn -n 100
systemctl restart zeppelin@orc - рестарт инстанса 

df -h: показывает все примонтированные шары 
cat /etc/fstab: показывает все примонтированные шары 