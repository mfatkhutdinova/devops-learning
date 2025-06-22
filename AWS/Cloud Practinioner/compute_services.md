# Compute services

Compute services:
1. EC2 - resizable compute capacity
2. Auto Scaling - encrease or decrease number of instances
3. Elastic Load Balanser - dstribute incoming traffic
3. Elastic Container Service - run applications on a managed cluster
4. Elastic Kubernetes Service - run K8s applications on AWS and on-premises
5. AWS Lambda - run code in response to events

Benefits of EC2:
- Elasticity 
- Control 
- Flexibility 
- Integrated 
- Reliable
- Secure 
- Cost-Effective 
- Easy 

Scaling on AWS:
- Launch new instances in advance of peak period 
- Use monitoring to programmatically scale out 
- Automatically scale in 
- Pay for the resources needed, only when needed

Elastic Load Balanser:
Automatically distribute traffic across multiple EC2 instances 
- Increases avialability and fault tolerance
- Configure health check 
- Offload encryption and decryption 
- Types: 
  - application load balancer (app layer)
  - network load balancer (network layer)
  - gateway load balancer (third-party virtual appliances) 
 
How will you deliver the application executables?  
Instances  
    • Amazon EC2  
Containers  
    • Amazon ECS  
    • Amazon EKS 
    • AWS Fargate
Serverless  
    • AWS Lambda

Six advantages of cloud computing:  
1. Pays as you go  
2. Benefit from massive economics of scale 
3. Stop guessing capacity 
4. Increase speed and agility 
5. Realize cost savings 
6. Go global in minute 

Choose the Right AWS Region  
When you decide which AWS Region to host your applications and workloads, consider four main aspects – latency, price, service availability, and compliance.  
Regions are clusters of Availability Zones. Availability Zones are clusters of data centers.  
  
