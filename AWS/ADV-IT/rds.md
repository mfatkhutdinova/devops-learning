# Relation DataBase 
RDS - Relation DataBase - база данных 

Важные возможносьт сервиса:  
- Public or Private Endpoint - URL базы данных с/без интернет доступа  
- Read Replica - создает дополнительный instance только для чтения  
- Backup SnapShots Automatic - стирается при удалении RDS Instance  
- Backup SnapShots Manual - не стирается при удалении RDS Instance   
- MultiAZ - создание дополнительного синхронизированного instance в другой AZ только для Fail Tolerance - для отказоустойчивости.  

БД:  
- Amazon Aurora (самая дорогая)   
- MySQL (порт 3306)  
- MariaDB  
- PostgreSQL   
- Oracle   
- Microsoft SQL Server (порт 1433)  

БД можно модифицировать после создания.   
Можно создавать notifincations на email на различные евенты в БД (удаление, падение и т.д.)  

Как импортировать вашу Базу Данных в SQL Server   
(Просто так через Restore не получится, вылезет ошибка)  

Несколько шагов:  
1. Create S3 bucket in SAME REGION as RDS and upload your .bak files  
2. Create new RDS OptionGroup with SQLSERVER_BACKUP_RESTORE option  
3. Apply this OptionGroup to your RDS INSTEAD of default OptionGroup  
4. Connect to RDS, open NewQuery and execute stored procedure  

Command:  
```
exec msdb.dbo.rds_restore_database
    @restore_db_name='MyDatabase',
    @s3_arn_to_restore_from='arn:aws:s3:::mybucketwith-beckupfile/MydatabaseForRDS.bac';
    
exec msdb.dbo.rds_task_status;
```

