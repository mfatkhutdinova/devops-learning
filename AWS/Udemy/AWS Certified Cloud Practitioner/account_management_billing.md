# Account Management Billing

#### AWS Organizations  
• Global service
• Allows to manage multiple AWS accounts
• The main account is the master account
• Cost Benefits:
  - Consolidated Billing across all accounts - single payment method
  - Pricing benefits from aggregated usage (volume discount for EC2, S3…)
  - Pooling of Reserved EC2 instances for optimal savings
• API is available to automate AWS account creation
• Restrict account privileges using Service Control Policies (SCP)

#### Multi Account Strategies
Create accounts per department, per cost center, per dev / test / prod, based on regulatory restrictions (using SCP), for better resource isolation (ex: VPC), to have separate per-account service limits, isolated account for logging  
• Multi Account vs One Account Multi VPC  
• Use tagging standards for billing purposes  
• Enable CloudTrail on all accounts, send logs to central S3 account  
• Send CloudWatch Logs to central logging account  

#### Service Control Policies (SCP)
• Whitelist or blacklist IAM actions  
• Applied at the OU or Account level    
• Does not apply to the Master Account  
• SCP is applied to all the Users and Roles of the Account, including Root user  
• The SCP does not affect service-linked roles  
• Service-linked roles enable other AWS services to integrate with AWS Organizations and can't be restricted by SCPs.  
• SCP must have an explicit Allow (does not allow anything by default)  

#### AWS Organization – Consolidated Billing 
• When enabled, provides you with:  
• Combined Usage – combine the usage across all AWS accounts in the AWS Organization to share the volume pricing, Reserved Instances and Savings Plans discounts  
• One Bill – get one bill for all AWS Accounts in the AWS Organization  
• The management account can turn off Reserved Instances discount sharing for any account in the AWS Organization, including itself

#### AWS Control Tower
• Easy way to set up and govern a secure and compliant multi-account AWS environment based on best practices

• Benefits:
  - Automate the set up of your environment in a few clicks
  - Automate ongoing policy management using guardrails
  - Detect policy violations and remediate them
  - Monitor compliance through an interactive dashboard
• AWS Control Tower runs on top of AWS Organizations:
  It automatically sets up AWS Organizations to organize accounts and implement SCPs (Service Control Policies)

#### AWS Resource Access Manager (AWS RAM)  
• Share AWS resources that you own with other AWS accounts  
• Share with any account or within your Organization  
• Avoid resource duplication!  
• Supported resources include Aurora, VPC Subnets, Transit Gateway, Route 53, EC2 Dedicated Hosts, License Manager Configurations…  

#### AWS Service Catalog  
• Users that are new to AWS have too many options, and may create stacks that are not compliant / in line with the rest of the organization  
• Some users just want a quick self-service portal to launch a set of authorized products pre-defined by admins  
• Includes: virtual machines, databases, storage options, etc…  
• Enter AWS Service Catalog!  

#### Pricing Models in AWS
• AWS has 4 pricing models:  
• Pay as you go: pay for what you use, remain agile, responsive, meet scale demands  
• Save when you reserve: minimize risks, predictably manage budgets, comply with long-terms requirements  
• Reservations are available for EC2 Reserved Instances, DynamoDB Reserved Capacity, ElastiCache Reserved Nodes, RDS Reserved Instance, Redshift Reserved Nodes  
• Pay less by using more: volume-based discounts  
• Pay less as AWS grows  

#### Savings Plan 
• Commit a certain $ amount per hour for 1 or 3 years   
• Easiest way to setup long-term commitments on AWS   
• EC2 Savings Plan 
• Up to 72% discount compared to On-Demand   
• Commit to usage of individual instance families in a region (e.g. C5 or M5)   
• Regardless of AZ, size (m5.xl to m5.4xl), OS (Linux/Windows) or tenancy   
• All upfront, partial upfront, no upfront   
• Compute Savings Plan   
• Up to 66% discount compared to On-Demand 4  
• Regardless of Family, Region, size, OS, tenancy, compute options   
• Compute Options: EC2, Fargate, Lambda   
• Machine Learning Savings Plan: SageMaker…   
• Setup from the AWS Cost Explorer console   
• Estimate pricing at https://aws.amazon.com/savingsplans/pricing/   

#### AWS Compute Optimizer
Reduce costs and improve performance by recommending optimal AWS resources for your workloads  
• Helps you choose optimal configurations and right - size your workloads (over/under provisioned)  
• Uses Machine Learning to analyze your resources’ configurations and their utilization CloudWatch metrics  
• Supported resources   
• EC2 instances   
• EC2 Auto Scaling Groups   
• EBS volumes   
• Lambda functions   
• Lower your costs by up to 25%   
• Recommendations can be exported to S3   

#### Billing and Costing Tools  
Estimating costs in the cloud:   
• Pricing Calculator   
• Tracking costs in the cloud:   
  - Billing Dashboard   
  - Cost Allocation Tags   
  - Cost and Usage Reports 
  - Cost Explorer   
• Monitoring against costs plans:   
  - Billing Alarms   
  - Budgets  

#### Cost Explorer  
• Visualize, understand, and manage your AWS costs and usage over time  
• Create custom reports that analyze cost and usage data.  
• Analyze your data at a high level: total costs and usage across all accounts  
• Or Monthly, hourly, resource level granularity  
• Choose an optimal Savings Plan (to lower prices on your bill)  
• Forecast usage up to 12 months based on previous usage   

#### AWS Budgets  
• Create budget and send alarms when costs exceeds the budget  
• 4 types of budgets: Usage, Cost, Reservation, Savings Plans  
• For Reserved Instances (RI)  
  - Track utilization  
  - Supports EC2, ElastiCache, RDS, Redshift  
• Up to 5 SNS notifications per budget  
• Can filter by: Service, Linked Account, Tag, Purchase Option, Instance Type, Region, Availability Zone, API Operation, etc…  
• Same options as AWS Cost Explorer!  
• 2 budgets are free, then $0.02/day/budget  

#### AWS Service Quotas  
• Notify you when you’re close to a service quota value threshold  
• Create CloudWatch Alarms on the Service Quotas console  
• Example: Lambda concurrent executions  
• Request a quota increase from AWS Service Quotas or shutdown resources before limit is reached  

#### Trusted Advisor 
• No need to install anything – high level AWS account assessment  

#### Analyze your AWS accounts and provides recommendation on 5 categories  
• Cost optimization   
• Performance   
• Security     
• Fault tolerance   
• Service limits  
 
#### Account Best Practices – Summary 
• Operate multiple accounts using Organizations  
• Use SCP (service control policies) to restrict account power  
• Easily setup multiple accounts with best-practices with AWS Control Tower  
• Use Tags & Cost Allocation Tags for easy management & billing  
• IAM guidelines: MFA, least-privilege, password policy, password rotation  
• Config to record all resources configurations & compliance over time  
• CloudFormation to deploy stacks across accounts and regions  
• Trusted Advisor to get insights, Support Plan adapted to your needs  
• Send Service Logs and Access Logs to S3 or CloudWatch Logs  
• CloudTrail to record API calls made within your account   
• If your Account is compromised: change the root password, delete and rotate all passwords / keys, contact the AWS support  
• Allow users to create pre-defined stacks defined by admins using AWS Service Catalog  

#### Billing and Costing Tools – Summary
• Compute Optimizer: recommends resources’ configurations to reduce cost  
• Pricing Calculator: cost of services on AWS  
• Billing Dashboard: high level overview + free tier dashboard  
• Cost Allocation Tags: tag resources to create detailed reports  
• Cost and Usage Reports: most comprehensive billing dataset  
• Cost Explorer: View current usage (detailed) and forecast usage  
• Billing Alarms: in us-east-1 – track overall and per-service billing  
• Budgets: more advanced – track usage, costs, RI, and get alerts  
• Savings Plans: easy way to save based on long-term usage of AWS  
• Cost Anomaly Detection: detect unusual spends using Machine Learning  
• Service Quotas: notify you when you’re close to service quota threshold  
