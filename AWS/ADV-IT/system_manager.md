# System Manager
Parameter Store - Хранение секретов
Хранение секретов - бесплатное 

1. Создаем параметры: логины, пароли
Можно менять параметры, записываются версии (евенты)
2. IAM -> create Role -> EC2 Role for Simple System Manager -> AmazonEC2RoleforSSM
3. In EC2 Attach IAM -> shoose your new Role
4. Теперь EC2 инстанс может видеть эти параметры

Command:
```
aws ssm get-parameters --name ParamName --region us-east-1
aws ssm get-parameters --name ParamName --region us-east-1 --output text 
aws ssm get-parameters --name ParamName --region us-east-1 --output text --query Parameters[].Value
aws ssm get-parameters --name PasswordName --region us-east-1 --with-decryption --output text --query Parameters[].Value

export DBPASSWORD=`aws ssm get-parameters --name DBpassword --region us-east-1 --with-decryption --output text --query Parameters[].Value`
```

RunCommand - Управление EC2 Серверами      
Можно запускать различные команды, не заходя на сервер     
AWS-RunShellScript    
Output команды выводится на AWS     
Это работает через aws-amazon-agent. Для некоторых инстансов автоматически добавляется, для остальных нужно будет добавить самому

Hybrid Infrastructure - Управление Серверами не в AWS  
Можно зарегистрировать свою тачку on-prem, чтобы через Run Command тоже запускать там команды без подключения.  

Для этого нужно:
1. Создать Activations, после создания получить Activation Code and Activation ID   
2. Выполнить команды для установки amazon-ssm-agent - https://docs.aws.amazon.com/systems-manager/latest/userguide/sysman-install-managed-linux.html  
```
mkdir /tmp/ssm
curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -o /tmp/ssm/amazon-ssm-agent.rpm
sudo yum install -y /tmp/ssm/amazon-ssm-agent.rpm
sudo stop amazon-ssm-agent
sudo -E amazon-ssm-agent -register -code "activation-code" -id "activation-id" -region "region"
sudo start amazon-ssm-agent
```
4. Использовать Run Command 

Windows Updates - Управление Обновлениями
1. Создаем роли IAM 
2. Приаттачиваем к ec2-instance
3. Объединяем сервера с помощью тэгов. Идем в Tags -> Edit Tag -> Patch Group - appServer (наименование группы)
4. Заходим в State Manager и создаем Assosiations (сервис, который проверяет все интсансы и говорит, какие пакеты нужно доустановить и т.д.)
5. Maintenance Windows - создаем роли, в которые указываем, какую команду во сколько по крону для каких серверов (групп серверов) нужно выполнить
