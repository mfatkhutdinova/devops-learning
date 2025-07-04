# Cloud Monitoring

CloudWatch - provides all metrics for every services in AWS  
CloudWatch Alarms - alarms are used to trigger notifications for any metric   
CloudWantch Logs - collect logs from:  
- Elastic Beanstalk
- ECS  
- AWS Lambda  
- CloudTrail  
- Route53  
By default, no logs from EC2 will go to CloudWatch  
You need to run a CloudWatch agent on EC2 to push the log files you want  

#### Amazon EventBridge 
Schedule: cron jobs (schedule scripts)  
Event Pattern: event rules to react to a service doing something   
Trigger Lambda functions, send SQS/SNS messages  

#### AWS CloudTrail  
Provides governance, compliance and audit for your AWS Account   
CloudTrail is enabled by default   
Get an history of events/API calls made within your AWS Account by:   
- console    
- SDK   
- CLI  
- AWS Services   
Can put logs from CloudTrail into CloudWatch Logs or S3   
!! If a resource is deleted in AWS, investigate CloudTrail first!!  

#### AWS X-Ray 
Debugging in Production, the good old way:  
- test locally   
- add log statements everywhere   
- re-deploy in production   
- tracing and get visual analysis of your application  
Log formats differ across applications and log analysus is hard   

AWS X-Ray - visual analisys of our applications. Advantages:  
- for troubleshooting   
- understand dependencies in a mocroservice architecture   
- pinpoing service issues   
- review request behavior   
- find errors and exceptions   

#### Amaxon CodeGuru  
An ML-powered service for automated code reviews and application performance recommendations   
Provides 2 functions:  
1. CodeGuru Review - automated code reviews for statis code analysis   
2. CodeGuru Profiler - visibility/recommendations about app performance during runtime (production)  

AWS Health Dashboard - Service History   
- Shows all regions, all services health   
- Shows historical information for each day   
- Has an RSS feed you can subscribe to   
- Previously called AWS Service Health Dashboard   

AWS Health Dashboard provides alerts and remediation guidance when AWS is experiencing events that may impact you.  

#### Monitoring Summary  
CloudWatch:  
• Metrics: monitor the performance of AWS services and billing metrics  
• Alarms: automate notification, perform EC2 action, notify to SNS based on metric  
• Logs: collect log files from EC2 instances, servers, Lambda functions…  
• Events (or EventBridge): react to events in AWS, or trigger a rule on a schedule  

CloudTrail: audit API calls made within your AWS account  
CloudTrail Insights: automated analysis of your CloudTrail Events  
X-Ray: trace requests made through your distributed applications  
AWS Health Dashboard: status of all AWS services across all regions  
AWS Account Health Dashboard: AWS events that impact your infrastructure  
Amazon CodeGuru: automated code reviews and application performance recommendations  
