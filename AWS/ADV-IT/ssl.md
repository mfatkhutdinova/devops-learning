# AWS Certificate Manager

HTTP - HyperText Transfer Protocol (не защищена)  
HTTPS - HyperText Transfer Protocol Secure. HTTPS = HTTP + SSL/TLS  (защищена, зашифрована с помощью сертификатов)  

SSL - Secure Sockets Layer 
TLS - Transport Layer Security

Защищенный коннект между клиентом и сервером. Данные зашифрованы.   

Сертификат может быть на определенный домен www.blabla.ru или  
WildCard сертификат *.blabla.ru: включит в себя домены поддомены prod.blabla.ru, test.blabla.ru и тд. Стоит дороже.  

SSL/TLS Сертификаты в AWS - бесплатные. Вы платите только за использованные ресурсы.   
SSL/TLS сертификаты приаттачиваются к таким ресурсам, как:   
- Elastic Load Balancer
- Amazon CloudFront
- Amazon Elastic Beanstalk
- Amazon API Gateway 
- AWS CloadFormation 

Просить подтвержение лучше через Email. Нужно будет аппрувнуть.   
