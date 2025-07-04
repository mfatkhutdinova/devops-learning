# Global Infrastructure Section

#### AWS Global Accelerator VS CloudFront 
- They both use the AWS global network and it's edge locations around the world  
- Both services integrate with AWS Shield for DDoD protection  
CloudFront - Content Delivery Network   
Improves performance for your cacheable content (such as images and videos) content is served as the edge  

#### Global Accelerator 
No caching, proxying packets at the edge to applications running in one or more AWS Regions  
Improves performance for a wide range applications over TCP or UDP  
Good for HTTP use cases that require static IP addresses  
Good for HTTP use cases that required deterministic, fact regional failover   

#### AWS Outposts 
AWS Outposts are "server racks" that offers the same AWS infrastracture, services, APIs tools to build your own applications on-premises just as in the cloud  
AWS will setup and manage "Outposts Racks" within your on-premises infrastracure and you can start leveraging AWS services on-premises   
YOU are responsible for the Outposts Rack physical security  

#### AWS WaveLength
WaveLengt Zones are infrastracture deployments embedded with the telecommunications providers datacenters at the edge of the 5G networks  
Ultra-low latency applications through 6G networks  
Use cases: smart cities, ML-assisted diagnostics, real-time gaming...  

#### AWS Local Zones
Places AWS compute, storage, database, and other selected AWS services closer to end users to run latency-senditive applications  
Extend your VPC to more locations - "Extension of an AWS Region"  

#### Global Applications in AWS - Summary
- Global DNS: Route 53  
  - Great to route users to the closest deployment with least latency  
  - Great for disaster recovery strategies  
- Global Content Delivery Network (CDN): CloudFront  
  - Replicate part of your application to AWS Edge Locations – decrease latency  
  - Cache common requests – improved user experience and decreased latency  
- S3 Transfer Acceleration  
  - Accelerate global uploads & downloads into Amazon S3  
- AWS Global Accelerator  
  -  Improve global application availability and performance using the AWS global network  
- AWS Outposts  
  - Deploy Outposts Racks in your own Data Centers to extend AWS services  
- AWS WaveLength  
  - Brings AWS services to the edge of the 5G networks  
  - Ultra-low latency applications  
- AWS Local Zones  
  - Bring AWS resources (compute, database, storage, …) closer to your users  
  - Good for latency-sensitive applications  
