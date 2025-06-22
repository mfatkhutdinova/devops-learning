# Cloud Architectural best practices

1. Design for failure and nothing fails
- avoid single points of failure
- multiple instances 
- multiple availability zones
- separate dingle server into multiple tiered application
- for RDS use Multi-AZ feature

2. Build security in every layer
- encrypt data at rest and in transit
- enforce principle of least privilege in IAM 
- implemente both Security Groups and Networs Access Control Lists (NACL)
- consider advanced security features and services 

3. Leverage different storage options 
- move static web assets to S3
- use CloudFront to serve globally 
- store session state in DynamoDB
- use ElasticCache between hosts and databases

4. Implement elasticity 
- implement Auto Scaling policies
- architect resiliency to reboot and relaunch 
- leverage managed services like S3 and DynamoDB

5. Think parallel
- scale horizontally, not vertically 
- decouple compute from session/state
- use Elastic Load Balancing
- right-size your infrastracture 

6. Loose coupling sets you free
- instead of a single, ordered workflow, use multiple queues 
- use amazon simple queue service and simple notification service (SQS and SNS)
- leverage existing services

7. Don't fear constraints 
- rethink traditional constraints
- need more RAM?
- better IOPS for database?
- response to failure

Six Pillars:
1. Operational Excellence 
2. Security 
3. Reliability 
4. Performance Efficienty 
5. Cost Optimization
6. Sustainability

AWS has identified four key best practices of cost optimization:  

- Rightsizing instances  
Rightsizing is the process of reviewing deployed resources and seeking opportunities to downsize when possible. For example, if an application instance is consistently underutilizing its RAM and CPU, switching that to a smaller instance can offer significant savings while maintaining the same performance.

- Increasing application elasticity
An example is using auto scaling to ensure that the correct number of instances are available to handle the workload of an application. Scale out during high demand and scale in during low demand.

- Choosing the right pricing model
An example is using Reserved Instances for workloads that need to run most or all the time, such as production environments. This can have a significant impact on savings compared to on-demand; in some cases, up to 75 percent.

- Optimizing storage
An example is the S3 Intelligent-Tiering storage class, which is designed to optimize costs by automatically moving data to the most cost-effective storage tier.
