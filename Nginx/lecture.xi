Nginx - обратный прокси сервер
Топ 1000 компаний его используют, потому что он быстро обрабатывает очень много запросов с наименьшим влиянием на память 

Преимущества .
- обрабатывает запросы асинхронно: 1 процесс Nginx может обрабатывать несколько запросов одновременно 
- менее требователен к ресурсам, потому что не обращается к серверным языкам 
- быстрый 

Установка .
  apt-get install nginx 

Терминология .
 Контексты - разделы в файлах конфигурации, в которых могут указываться директивы 
 Директивы - конкретные опции конфигурации, которык указаны в файлах конфигурации. 
   Они состоят из имени опции и значения опции 

Порядок совпадения .
  =  полное совпадение 
  ^~ префикс преимущества 
  ~ & *~ регулярные выражения 
  без модификатора - соврадение префикса 

Логирование .
  /var/log/nginx/error.log
  /var/log/nginx/access.log

  Отключение логов: .
    access_log off;
    error_log off;

Наследование .
  http -> server -> location 

  Стандартные директивы - сначала переменная объвляется и это действует на всех до того момента, пока он не будет переопределен
  Диррективы массивы - почти как стандартные, но их можно переопределять несколько раз 
  Директивы действия - наследование прерывается
  try_files - сначала попробуй, а потом делай. Наследование не наследуется 

Настройка backend .
  apt-get install php5-fpm 
  apt-get install php5-mysql
  apt-get install php5
  apt-get install php5-cgi

Настройка ворекров .
  worker_process auto; - сообщаем, сколько процессов можно запускать. Обычно нужно ставить значение кол-ва ядер на севере. Если стоит auto, то он автоматически подставит это число 
    (nproc; lscpu)
  worker_connections 1024; - указываем кол-во одновременных запросов он может обрабатывать (ulimit -n)

Директива expires .
  Говорит браузеру хэшировать определнные ресурсы определенное кол-во времени. Это значит, что при след загрузке браузеру не нужно будет заново запрашивать этот файл 
  expires 30d;
  expires 1M;
  Это снижает загрузки файлов 

Gzip .
  С помощью него можно значительно снизить размер статических файлов, которые передаются клиенту 
  gzip on; 
  gzip_min_length 100; (байт)
  gzip_comp_level 3; (чем больше знаение, тем сильнее будет сжатие и тем больше будет требоваться производительность. Значение ниже 5 будет оказыват незначительное влияние на производительность)
  gzip_types text/plain text/css text/javascript; (какие типы файлов будем сжимать)
  gzip_disable "msie6"; (проверяет сроку юзер агента, которую отправляет клиеент и если значение совпадает, то gzip должен быть отключен)

FastCgi .
  Помогает ускорить работу сервера, но нам нужно контролировать, что хешировать, а что нет 
  fastcgi_cache_path /tmp/nginx_cache levels=1:2 keyы_zone=microcache:10m max_size=500m; (указываем, где будут храниться файлы кеша 10m-сколько храним, 500m-максимальное время хранения хеша)
  fastcgi_cache_key (в каком формате будем хранить)
  add_header microcache-status $upstream_cache_status; (показывает использовался ли хеш ) HIT - хэшированный ответ, BYPASS - ответ на этот запрос никогда не хешировался, MISS - хеш неактуален, мы выдими свежую версию 
  set $no_cache 0; (ничего не хешируем)


Лимиты в Nginx .
  1. Параллельное соединение 
  2. Одновременные подключения  

  limit_conn_zone $server_name zone=pre_vhost:5m;
  limit_conn_zone $binary_remote_addr zone=per_ip::5m;
  limit_req_zone $binary_remote_addr zone=one_per_sec:5m rate=1r/s;

Video Streaming .
  Для установки: --with-http_mp4_module 
  Нужен для обработки файла 
  Можно контролировать скорость передачи ответа клиенту и размер буфера 

  location ~ \.mp4$ {
    root /sites/downloads/;
    mp4;
    mp4_buffer_size 4M;
    mp4_max_buffer_size 10M;
  }

GeoIp .
  Для установки: --with-http_geoip_module 
  apt-get install libgeoip-dev
  БД нужно скачать на dev.maxmind.com 

  geoip_country /etc/nginx/geoip/GeoIP.dat;
  geoip_city /etc/nginx/geoip/GeoLiteCity.dat;

  location /geo_country {
    return 200 "Visiting from: $geoip_country_name";
  }

HTTP2 Nginx .
  - бинарный протокол (компактный способ передачи данных)
  - сжатие заголовков 
  - постоянные соединения
  - мультиплексные потоки 
  - ресверные push'ы

  http1 = 3 соединения (просмотр обычной страницы)
  http2 = 1 соедиинение 

  --with-http_v2_module 
  --with-http_ssl_module 

  server {
    listen 443 ssl http2;
    server_name localhost;

    ssl_certificate     /usr/local/nginx/ssl/nginx.crt;
    ssl_certificate_key /usr/local/nginx/ssl/nginx.key;

    ssl_session_cache shared:SSL:1m;
    ssl_session_timeout 5m;

    ssl_prefer_server_ciphers off;

    location / {
      root html;
      index index.html index.httm;
    }

  }

Аутентификация .
  apt-get-install apache-utils
  sudo htpasswd -c /etc/nginx/.htpassw stackacademy (создание пароля)

  ayth_basic "Restricted Content";
  auth_basic_user_file /etc/nginx/.htpassw;

Безопасность .
  - отключите серверные токены
  - удалите неиспользуемые модули 
  - задайте разммеры буферов 
  - заблокируйте юзер агенты: if($http_user_agent ~* badbot) {return 403}
  - настройте X-Frame-Options: add_header X-Frame-Options SAMEORIGIN;

  http://modsecurity.org

Lets Encrypt .
  бесплатные сертификаты 
  certbot --nginx 
  обновление сертификатов можно автоматизировать
  @daily certbot renew 

Обратный прокси и балансировка .

Балансировщик нагрузки .
  - обеспечивает равномерную нагрузку на всех серверах 
  - если один сервер вышел из строя, то запрос все равно должен отработать 
