find path -name filename - найти файлы и директории с именм файл в path
find . -name "*.js" - поиск в заданной директории (и ее поддиректориях) файлы определенного типа
scp -r zeppelin@m1-zeppelin01p:/opt/app/zeppelin_cmn/helium-repo zeppelin_fnr/
tail somefile - читает заданный в качестве аргумента файл и выводит его последнюю часть («хвост»)
head somefile - читает заданный в качестве аргумента файл и выводит его первую часть 
wget someurl - ПО для скачивания файлов через HTTP, HTTPS, FTP и FTPS —
grep "нужная строка" file - осуществляет поиск заданного шаблона в каждом файле

cat /var/log/dmesg - информация о загрузке 
dmesg - все сообщения ядра 

pstree - дерево всех запущенных процессов 
journalctl -u USERNAME -n 1000