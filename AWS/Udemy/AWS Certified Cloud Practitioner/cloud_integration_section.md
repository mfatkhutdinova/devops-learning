# Cloud Integration Section

### Amazon SQS = Simple Queue Service  
Fully managed service (~serverless), use to decople applications  
Messages are deleted after they are read by consumers  
Consumers share the work to read messages & scale horizontally   
FIFO Queue = First In First Out  

### Amazon Kinesis
Kinesis = real-time big data streaming  
Managed service to collect, process and analyze real-time streaming data at any scale  
Kinesis Data Streams: low latency streaming to ingest data at scale from hundreds of thousands of sources  
Kinesis Data Firehose: load streams into S3, Redshict, ElasticSearch, etc..  
Kinesis Data Analytics: performreal-time analytics on streaming using SQL  
Kinesis Video Streams: monitor real-time video streams for analytics or ML  

### Amazon SNS 
The "event publisher" only sends message to one SNS topic   
As many "event subscribers" as we want to listen to the SNS topic notifications  
Each subscriber to the topic will get all the messages  
Notification, publish subscribe = SNS   

### Amazom MQ
When migrating to the cloud, instead of re-engineering the application to use SQS and SNS, we can use Amazon MQ    
Amazon MQ is managed message brocker service for RabbitMQ and ActiveMQ    

### Integration Section – Summary    
SQS:    
• Queue service in AWS   
• Multiple Producers, messages are kept up to 14 days  
• Multiple Consumers share the read and delete messages when done  
• Used to decouple applications in AWS  

SNS:  
• Notification service in AWS    
• Subscribers: Email, Lambda, SQS, HTTP, Mobile…  
• Multiple Subscribers, send all messages to all of them  
• No message retention  

Kinesis: real-time data streaming, persistence and analysis  
Amazon MQ: managed message broker  
