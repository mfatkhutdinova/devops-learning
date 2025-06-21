# EC-2 instances
Виртуальные сервера EC2 - Elastic Compute Cloud

Виды серверов: 
1. On demand - платим за фиксированную ставку
2. Spot - ставки. Стиавите условие, я готов платить 10 центов за 10 серверов в час. Если у Amazon юудут скидки и вы попадете под условие, то ваши машины включатся 
Если машины выключается автомат из-за Amazon, то за последний час вы не платите. Это не ваша вина. 
3. Reserved (1-3 year) - резерв машины на несколько лет за фиксированную цену. 
4. Scheduled Reserved (daily. weekly. monthly) - тоже резверв, но меньший период. Цена меньше, чем в demand.
5. Dedicated Hosts - арендуете весь вервер, а не кусочек. Нужно иногда для лицензий. 

Типы серверов: 
T - General Purpose   
M - General Purpose    
C - Compute Optimazed   
F - FPGA Optimized   
G,P - GPU Optimized   
X,R - RAM Memory Optimized   
D,I - Storage Optimized   

EBS - Elastic Block Store (hard disks)
Типы дисков:  
1. Root-Boot:   
    - General Purpose SSD (GP2) up to 10.000 iops   
    - Provisioned IOPS SSD (IO1) up to 20.000 iops   
    - Magnetic   

2. Other:   
    - Thoughput Optimized HDD (ST1)  
    - Cold HDD (SC1)  

Instance - виртуальный сервер 
Volume - HDD/SSD диск
Snapshot - резервная копия Volume 
AMI - резервня копия Instance 

AMI - Amazon Machine Images 

Reboot Instance - инстанс будет работать в том же дата центре.  
Stop, Start - инстанс будет работать в другом дата центре, ip адрес поменяется   

Bootstrapping   
При настройке инстанса в разделе Advanced можно написать код, который должен выполниться при настройке инстанса.   
Лог можно посмотреть в /var/log/cloud-init-output.log  
 
Private IP - адрес доступный внутри сети. Постоянный и не изменяется  
Public IP - адрес доступный в интернете.   
Временный. Изменяется при Stop, Start сервера. Не изменяется при Reboot сервера  
Elastic IP - адрес доступный в интернете. Постоянный и не изменяется. Аттачивается к серверу   
Лимит: 5 адресов для каждого региона   

Можно добыть инфу о вашем сервере, используя ip адрес - http://169.254.169.254/latest/meta-data/
Удобно использовать, потому что, например ifconfig выдает куча инфы и нужно вырезать   

Elastic Load Balancer:   
Отсылает трафик на сервисы равномерно. Если млн ревестов в секунду, то через Support нужно запрашивать Prewarm load balancer   

Auto Scaling Group:  
Vertical Saling - t2.micro -> t2.meduim -> c4.xlarge    
Horizontal Saling - это когда при нехватке ресурсов добавляешь кол-во сервисов   

Launch Configuration:    
описывает какой сервер запускать: тип, какие диски прикреплять, ssh key, userDate script   
Нельзя заменить, можно только скопировать и создать новый   

Auto Scaling Group:  
описывает сколько серверов запускать, когда запускать, а также когда убивать  

Subnet in AZ: какие AZ использовать для запуска серверов   
  - Min: минимальное кол-во Running серверов  
  - Max: максимальное кол-во Running серверов   
  - Desired: желаемое текущее кол-во серверов
  - LoadBalancer: какой ELB присоединить ко всем серверам   
  - Scale OUT: когда добавлять серверы   
  - Scale IN: когда убивать серверы  
 
