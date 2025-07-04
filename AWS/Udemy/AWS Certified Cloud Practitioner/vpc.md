# VPC Section

VPC - Virtual Pricate Cloud: private network to deploy your resources (regional resource)  
Subnet - allow you to partition your network inside your VPC (Availability Zone resource)  
A Public subnet - is a subnet that is accessibke from the Internet   
A Private subnet - is a subnet that is not accessible from the Internet   
To define access to the Internet and between subnet, we use Route Tables.   

Inetrnet Gateways helps our VPC instances connect with the Internet   
Public Subnet have a route to the Internet gateway.  

NAT Gatways & NAT Instances allow your instances in your Private Subnet to access the Internet while remaining private.  

#### NACL (Network ACL)  
- A firewall which controls traffic from and to Subnet
- Can have ALLOW and DENY rules
- Are attached at the Subnet level 
- Rules only include IP Addresses

#### Security Groups
- A firewall that controls traffic to and from an ENI/an EC2 Instance 
- Can have only ALLOW rules
- Rules include IP addresses and other security groups 


#### VPC Flow Logs 
Capture information about IP traffic goiong into your interfaces:
- VPC Flow Logs
- Subnet Flow Logs 
- Elastic Network Interface Flow Logs 
Helps to monitor & troubleshoot connectivity issues.   
Captures netword information from AWS managed interface too: Elastic Load Balancers, ElastiCache, RDS, Aurora  
VPC Flow logs data can go to S3, CloudWatch Logs and Kinesis Data Firehose   

#### VPC Peering 
Connect two VPC, privately using AWS' network   
Make them behave as if they were in the same network   
Must not have overlapping CIDR (IP adress range)  
VPC Peering connection is not transitive (must be established for each VPC that need to communicate with one another)  

#### VPC Endpoints   
Endpoints allow you to connect to AWS Services using a private network instead of the public www network   
This gives you enhanced security and lower latency to access AWS Services   
VPC Enpoint Gateway: S3 & DynamoDB  
VPC Endpoint Interface: the rest   

#### AWS PrivateLink (VPC Endpoint Services)
- Most secure & scalable way to expose a service 1000s of VPCs
- Does not require VPC peering, internet gateway, NAT, route tables...
- Requires a network load balancer (Service VPC) and ENI (Customer VPC)

#### Site to Site VPN 
- Connect an on-premises VPN to AWS 
- The connection is automatically encrypted 
- Goes over the public internet 

#### Direct Connect (DX)
- Establish a physical connection between on-premises and AWS 
- The connection is private, secure and fast 
- Goes over a private network 
- Takes at least a month to establish 

On premises: must a Customer Gateway (CGW)  
AWS: must use a Virtual Private Gateway (VGW)  
  
#### AWS Client VPN 
Connect from your computer using OpenVPN to your private network in AWS and on-premises  
Allow you to connect to your EC2 instances over a private IP   
Goes over public internet   

#### Transit Gateway 
For having transitive peering between thousands of VPC and on-premises, hub-and spokke (star) connection  
One single Gateway to provide this functionality   
Works with Direct Connect Gateway, VPN connections   

#### VPC Closing Comments
- VPC – Virtual Private Cloud
- Subnets – Tied to an AZ, network partition of the VPC
- Internet Gateway – at the VPC level, provide Internet Access
- NAT Gateway / Instances – give internet access to private subnets
- NACL – Stateless, subnet rules for inbound and outbound
- Security Groups – Stateful, operate at the EC2 instance level or ENI
- VPC Peering – Connect two VPC with non overlapping IP ranges, nontransitive
- Elastic IP –fixed public IPv4, ongoing cost if not in-use
- VPC Endpoints – Provide private access to AWS Services within VPC
- PrivateLink – Privately connect to a service in a 3rd party VPC
- VPC Flow Logs – network traffic logs
- Site to Site VPN – VPN over public internet between on-premises DC and AWS
- Client VPN – OpenVPN connection from your computer into your VPC
- Direct Connect – direct private connection to AWS
- Transit Gateway – Connect thousands of VPC and on-premises networks together

