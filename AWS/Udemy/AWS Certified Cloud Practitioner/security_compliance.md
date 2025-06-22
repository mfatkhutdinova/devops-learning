# Security & Compliance

- AWS responsobility - Security of the Cloud  
Protecting infra (hardware, software, facilities and networking) that runs all the AWS services  
Managed services like S3, DynamoDB, RDS, etc  
- Customer responsobility - Security in the Cloud
  
For EC2 instance, customer is responcible for management of the guest OS (including security patches and updates), firewall & network configuration, IAM

#### Encrypting application data 
Shared controls: Patch managements, Configuration management, awareness & training 

DDOS Protection on AWS  
- AWS Shield Standart: protects against DDOS atack for your website and apps
- AWS Shield Advanced: 24/7 premium DDoS protection 
- AWS WAF: Filterspecific requests based on rules 
- CloudFront and Route 53L:
  - availability protection using global edge network 
  - combined with AWS Shield, provides attack mitigaion at the edge 

Be ready to scale - leverage AWS Auto Scaling   

#### AWS Network Firewall   
- Protect your entire Amazon VPC 
- From Layer 3 to Layer 7 proyection
- Any direction 

Data at rest VS Data in transit   
1. At rest: data stored or archivied on a device 
2. In transit (in motion): data being moved from one location to another 
3. We want to encrypt data in both states to protect it!
For this we leverage encryption keys 

AWS KMS - Key Management Service 
CloudHSM - AWS provisions encryption hardware 

Types of Customer Master Keys: CMK 
- Customer Managed CMK: 
  - Create, manage and used by the customer, can enable ot disable 
  - Possibility of rotation policy 
- AWS managed CMK: 
  - Created, managed and used on the customer's behalf by AWS
  - Used by AWS services 
- AWS owned CMK: Collection of CMKs that an AWS service owns and manages to use in multiple accounts AWS can use those to protect resources in your account 
- CloudHSM Keys
  -  Keys generated from your own CloudHSM hardware device
  - Cryptographic operations are performed withing the CloudHSM cluster 

AWS Certificate Manager (ACM)
- Let's you provisio, manage and deploy SSL/TLS Certificates
- Used to provide in-flight encryption for websites - HTTPS
- Automatic TLS certificate renewal 

AWS Secret Manager:
- Newer service, meant for storing secrets 
- Capability to force rotation of secrets every X days 
- Integration with Amazon RDS (MySQL, PostgreSQL, Aurora)

#### AWS Artifact (not really a service)
- Portal that provides customers with on-demand access to AWS compliance documentation and AWS agreements
- Artifact Reports - Allows you to download AWS security and compliance documents from third-party auditors, like AWS ISO certifications, Payment Card Industry (PCI), and System and Organization Control (SOC) reports
- Artifact Agreements - Allows you to review, accept, and track the status of AWS agreements such as the Business Associate Addendum (BAA) or the Health Insurance Portability and Accountability Act (HIPAA) for an individual account or in your organization

#### Amazon GuardDuty
- Intelligent Threat discovery to protect your AWS Account
- Uses Machine Learning algorithms, anomaly detection, 3rd party data
- One click to enable (30 days trial), no need to install software

- Input data includes:
  - CloudTrail Events Logs – unusual API calls, unauthorized deployments
    - CloudTrail Management Events – create VPC subnet, create trail, …
    - CloudTrail S3 Data Events – get object, list objects, delete object, …
  - VPC Flow Logs – unusual internal traffic, unusual IP address
  - DNS Logs – compromised EC2 instances sending encoded data within DNS queries
  - Optional Features – EKS Audit Logs, RDS & Aurora, EBS, Lambda, S3 Data Events…
-  Can setup EventBridge rules to be notified in case of findings
- EventBridge rules can target AWS Lambda or SNS
- Can protect against CryptoCurrency attacks (has a dedicated “finding” for it)

#### Amazon Inspector
- Automated Security Assessments
- For EC2 instances
  - Leveraging the AWS System Manager (SSM) agent
  - Analyze against unintended network accessibility
  - Analyze the running OS against known vulnerabilities
- For Container Images push to Amazon ECR
  - Assessment of Container Images as they are pushed
- For Lambda Functions
  - Identifies software vulnerabilities in function code and package dependencies
  - Assessment of functions as they are deployed
- Reporting & integration with AWS Security Hub
- Send findings to Amazon Event Bridge

#### What does Amazon Inspector evaluate?
- Remember: only for EC2 instances, Container Images & Lambda functions

#### AWS Config
- Helps with auditing and recording compliance of your AWS resources
- Helps record configurations and changes over time
- Possibility of storing the configuration data into S3 (analyzed by Athena)

#### Questions that can be solved by AWS Config:
- Is there unrestricted SSH access to my security groups?
- Do my buckets have any public access?
- How has my ALB configuration changed over time?

- You can receive alerts (SNS notifications) for any changes
- AWS Config is a per-region service
- Can be aggregated across regions and accounts

#### AWS Macie
- Amazon Macie is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in AWS.
- Macie helps identify and alert you to sensitive data, such as personally identifiable information (PII)

#### AWS Security Hub
- Central security tool to manage security across several AWS accounts and automate security checks
- Integrated dashboards showing current security and compliance status to quickly take actions

#### Amazon Detective
- GuardDuty, Macie, and Security Hub are used to identify potential security issues, or findings
- Sometimes security findings require deeper analysis to isolate the root cause and take action – it’s a complex process
- Amazon Detective analyzes, investigates, and quickly identifies the root cause of security issues or suspicious activities (using ML and graphs)
- Automatically collects and processes events from VPC Flow Logs, CloudTrail, GuardDuty and create a unified view
- Produces visualizations with details and context to get to the root cause

#### AWS Abuse
- Report suspected AWS resources used for abusive or illegal purposes

#### Abusive & prohibited behaviors are:
- Spam – receving undesired emails from AWS-owned IP address, websites & forums spammed by AWS resources
- Port scanning – sending packets to your ports to discover the unsecured ones
- DoS or DDoS attacks – AWS-owned IP addresses attempting to overwhlem or crash your servers/softwares
- Intrusion attempts – logging in on your resources
- Hosting objectionable or copyrighted content – distributing illegal or copyrighted content without consent
- Distributing malware – AWS resources distributing softwares to harm computers or machines

#### Root user privileges
- Root user = Account Owner (created when the account is created)
- Has complete access to all AWS services and resources
- Lock away your AWS account root user access keys!
- Do not use the root account for everyday tasks, even administrative tasks

#### Actions that can be performed only by the root user:
- Change account settings (account name, email address, root user password, root user access keys)
- View certain tax invoices
- Close your AWS account
- Restore IAM user permissions
- Change or cancel your AWS Support plan
- Register as a seller in the Reserved Instance Marketplace
- Configure an Amazon S3 bucket to enable MFA
- Edit or delete an Amazon S3 bucket policy that includes an invalid VPC ID or VPC endpoint ID
- Sign up for GovCloud


#### Section Summary: Security & Compliance
- Shared Responsibility on AWS
- Shield: Automatic DDoS Protection + 24/7 support for advanced
- WAF: Firewall to filter incoming requests based on rules
- KMS: Encryption keys managed by AWS
- CloudHSM: Hardware encryption, we manage encryption keys
- AWS Certificate Manager: provision, manage, and deploy SSL/TLS Certificates
- Artifact: Get access to compliance reports such as PCI, ISO, etc…
- GuardDuty: Find malicious behavior with VPC, DNS & CloudTrail Logs
- Inspector: find software vulnerabilities in EC2, ECR Images, and Lambda functions
- Network Firewall: Protect VPC against network attacks
- Config: Track config changes and compliance against rules
- Macie: Find sensitive data (ex: PII data) in Amazon S3 buckets
- CloudTrail: Track API calls made by users within account
- AWS Security Hub: gather security findings from multiple AWS accounts
- Amazon Detective: find the root cause of security issues or suspicious activities
- AWS Abuse: Report AWS resources used for abusive or illegal purposes
- Root user privileges:
- Change account settings
- Close your AWS account
- Change or cancel your AWS Support plan
- Register as a seller in the Reserved Instance Marketplace
- IAM Access Analyzer: identify which resources are shared externally
