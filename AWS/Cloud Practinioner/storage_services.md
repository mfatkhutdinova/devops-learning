# Storage services

A reliable, scalable and secure place for data 

Storage services:
1. Elastic Block Store (EBS) - persistent block-level storage
2. S3 - durable, scalable object storage 
3. S3 Glacier - data archiving and backup
4. Storage Gateway - integrate cloud storage with on-site workloads
5. Elastic File System - file storage for Amazon EC2 instances 
6. FSx - file storage for widely-used file systems 

Elastic Block Store (EBS)
Network-attached block storage for use with EC2 instances:
- persist independently from instances 
- used like physical hard drive 
- automatically replicated 
- attached to any instance in the same AZ 
- one EBS volume to one EC2 instance 
- EBS volumes can retain data after EC2 instance termination 
- allow point-in-time snapshots to S3 GiB increments

Simple Storage Service - S3  
Infinite scalability, greater analysis and faster data retrieval   
Highly scalable object storage with 99.999999999% durability and 99.99% availability  

Common S3 use cases:
- Data lakes
- Backup and storage 
- Application hosting 
- Media hosting 

Storage classes:  
| Class                           |        Data                |
|---------------------------------|----------------------------|
| S3 Standard                     | ACTIVE DATA   
| S3 Standard-Infrequent Access   | INFREQUENTLY ACCESSED DATA 
| S3 One Zone-Infrequent Access   | INFREQUENTLY ACCESSED DATA    
| S3 Glacier storage classes      | ARCHIVED DATA  
