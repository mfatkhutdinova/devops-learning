# Cross Account Access
Cross Account Access - Доступ к другим Аккаунтам

1. В Аккаунте, к которому нужно получить доступ, создаете IAM Role с требуемыми привилегиями и в Trust relationship 
прописываем кто и с какого Аккаунта может использовать эту Role
Support -> Account number (нужно скопировать)
Create Role -> Another AWS Account -> снизу вставляем Account number
Выбираем Роли (доступы), которын нужны 
Другим программистам, кому шарим доступ, нужно предоставить Role ARN

2. Пользователь с Аккаунта, который хочет получить доступ, делает Assume Role и получает временные Credentials

Command: 
sts assume-role role-arn "Role ARN" --role-session "TestSomething"

Команда выше выдаст SecretAccessKey, SessionToken, AccessKeyID (их нужно сохранить)
и создать переменные окружения, вставляя полученные данные 

export AWS_ACCESS_KEY_ID = 
export AWS_SECRET_ACESS_KEY = 
export AWS_SESSION_TOKEN = 

Либо в браузере:
- вставить ссылку, которую дали 
- или switch role и вставить Account, Role 
Можно сохранить до 5 аккаунтов, которые можно менять.
