**AWS Shield Advanced** provides expanded DDoS attack protection for web applications running on the following resources: Amazon Elastic Compute Cloud, Elastic Load Balancing (ELB), Amazon CloudFront, Amazon Route 53, AWS Global Accelerator.

**Amazon Macie** is a fully managed data security and data privacy service that uses machine learning and pattern matching to discover and protect your sensitive data in AWS.

**Agility** - In the world of cloud computing, "Agility" refers to the ability to rapidly develop, test and launch software applications that drive business growth Another way to explain "Agility" - AWS provides a massive global cloud infrastructure that allows you to quickly innovate, experiment and iterate. Instead of waiting weeks or months for hardware, you can instantly deploy new applications. This ability is called Agility.

**Elasticity** - This refers to the ability to acquire resources as you need and release when they are no longer needed is termed as Elasticity of the Cloud.

**Reliability** - This refers to the ability of a system to recover from infrastructure or service disruptions, by dynamically acquiring computing resources to meet demand, and mitigate disruptions.

**Scalability** - Scalability is the measurement of a system's ability to grow to accommodate an increase in demand, or shrink down to a diminishing demand.

**Amazon Inspector** is an automated security assessment service that helps improve the security and compliance of applications deployed on your Amazon EC2 instances. Amazon Inspector automatically assesses applications for exposure, vulnerabilities, and deviations from best practices. After performing an assessment, Amazon Inspector produces a detailed list of security findings prioritized by level of severity. These findings can be reviewed directly or as part of detailed assessment reports which are available via the Amazon Inspector console or API.

**Amazon GuardDuty** - Amazon GuardDuty is a threat detection service that monitors malicious activity and unauthorized behavior to protect your AWS account. GuardDuty analyzes billions of events across your AWS accounts from AWS CloudTrail (AWS user and API activity in your accounts), Amazon VPC Flow Logs (network traffic data), and DNS Logs (name query patterns). This service is for AWS account level access, not for instance-level management like an EC2. GuardDuty cannot be used to check OS vulnerabilities.

Each AWS Region consists of a minimum of three Availability Zones (AZ).

**AWS Artifact** is your go-to, central resource for compliance-related information that matters to your organization. It provides on-demand access to AWS security and compliance reports and select online agreements. Reports available in AWS Artifact include our Service Organization Control (SOC) reports, Payment Card Industry (PCI) reports, and certifications from accreditation bodies across geographies and compliance verticals that validate the implementation and operating effectiveness of AWS security controls. Different types of agreements are available in AWS Artifact Agreements to address the needs of customers subject to specific regulations. For example, the Business Associate Addendum (BAA) is available for customers that need to comply with the Health Insurance Portability and Accountability Act (HIPAA). It is not a service, it's a no-cost, self-service portal for on-demand access to AWS compliance reports.

**Amazon MQ** is a managed message broker service for Apache ActiveMQ and RabbitMQ that makes it easy to set up and operate message brokers on AWS.

The **AWS Well-Architected Framework**: operational excellence, security, reliability, performance efficiency, cost optimization and sustainability 

**AWS CAF** groups its capabilities in six perspectives: Business, People, Governance, Platform, Security, and Operations.

**AWS Local Zones** allow you to use select AWS services, like compute and storage services, closer to more end-users, providing them very low latency access to the applications running locally. AWS Local Zones are also connected to the parent region via Amazon’s redundant and very high bandwidth private network, giving applications running in AWS Local Zones fast, secure, and seamless access to the rest of AWS services.

**AWS Trusted Advisor** is an online tool that provides you real-time guidance to help you provision your resources following AWS best practices on cost optimization, security, fault tolerance, service limits, and performance improvement.

AWS Identity and Access Management (AWS IAM), Amazon CloudFront, Amazon Route 53 and AWS Web Application Firewall (AWS WAF) are some of the global services.

AWS Health - Your Account Health Dashboard provides alerts and remediation guidance when AWS is experiencing events that may impact you.
With AWS Health - Your Account Health Dashboard, alerts are triggered by changes in the health of your AWS resources, giving you event visibility, and guidance to help quickly diagnose and resolve issue

**AWS CloudHSM** is a cloud-based Hardware Security Module (HSM) that enables you to easily generate and use your encryption keys on the AWS Cloud.

**AWS Key Management Service (AWS KMS)** - AWS Key Management Service (AWS KMS) makes it easy for you to create and manage cryptographic keys and control their use across a wide range of AWS services and in your applications. 

### There are three fundamental drivers of cost with AWS: compute, storage, and outbound data transfer.

**Amazon Eventbridge** - service that provides real-time access to changes in data in AWS services, your own applications, and software as a service (SaaS) applications without writing code. Amazon EventBridge Scheduler is a serverless task scheduler that simplifies creating, executing, and managing millions of schedules across AWS services without provisioning or managing underlying infrastructure.

**Amazon EMR** is the industry-leading cloud big data platform for processing vast amounts of data using open source tools such as Hadoop, Apache Spark, Apache Hive, Apache HBase, Apache Flink, Apache Hudi, and Presto. Amazon EMR can be used to provision resources to run big data workloads on Hadoop clusters.

**AWS Step Functions** - AWS Step Functions service lets you coordinate multiple AWS services into serverless workflows. You can design and run workflows that stitch together services such as AWS Lambda, AWS Glue and Amazon SageMaker.

**AWS Batch** - You can use AWS Batch to plan, schedule and execute your batch computing workloads across the full range of AWS compute services.

**AWS Partner Network (APN)** - Organizations can take help from the AWS Partner Network (APN) to identify the right AWS services to build solutions on AWS Cloud.

**AWS Global Accelerator** is a service that improves the availability and performance of your applications with local or global users. 

**AWS OpsWorks** - AWS OpsWorks is a configuration management service that provides managed instances of Chef and Puppet

**AWS Config** is a service that enables you to assess, audit, and evaluate the configurations of your AWS resources. Config continuously monitors and records your AWS resource configurations and allows you to automate the evaluation of recorded configurations against desired configurations. 
**Think resource-specific history, audit, and compliance; think Config.**

# Routing policies
**Simple routing policy** – Use for a single resource that performs a given function for your domain, for example, a web server that serves content for the example.com website. You can use simple routing to create records in a private hosted zone.

**Failover routing policy** – Use when you want to configure active-passive failover. You can use failover routing to create records in a private hosted zone.

**Geolocation routing policy** – Use when you want to route traffic based on the location of your users. You can use geolocation routing to create records in a private hosted zone.

**Geoproximity routing policy** – Use when you want to route traffic based on the location of your resources and, optionally, shift traffic from resources in one location to resources in another location. You can use geoproximity routing to create records in a private hosted zone.

**Latency routing policy** – Use when you have resources in multiple AWS Regions and you want to route traffic to the Region that provides the best latency. You can use latency routing to create records in a private hosted zone.

**IP-based routing policy** – Use when you want to route traffic based on the location of your users, and have the IP addresses that the traffic originates from.

**Multivalue answer routing policy** – Use when you want Route 53 to respond to DNS queries with up to eight healthy records selected at random. You can use multivalue answer routing to create records in a private hosted zone.

**Weighted routing policy** – Use to route traffic to multiple resources in proportions that you specify. You can use weighted routing to create records in a private hosted zone.

**AWS Fargate** - AWS Fargate is a serverless compute engine for containers. It works with both Amazon Elastic Container Service (Amazon ECS) and Amazon Elastic Kubernetes Service (Amazon EKS).

**AWS Snowball** - is a data migration and edge computing device. If you have large quantities of data you need to migrate into AWS, offline data transfer with AWS Snowball can overcome the challenge of limited bandwidth, and avoid the need to lease additional bandwidth. 

## A JSON policy document includes these elements:
- Optional policy-wide information at the top of the document
- One or more individual statements

Each statement includes information about a single permission. The information in a statement is contained within a series of elements.
1. Version – Specify the version of the policy language that you want to use. As a best practice, use the latest 2012-10-17 version.
2. Statement – Use this main policy element as a container for the following elements. You can include more than one statement in a policy.
3. Sid (Optional) – Include an optional statement ID to differentiate between your statements.
4. Effect – Use Allow or Deny to indicate whether the policy allows or denies access.
5. Principal (Required in only some circumstances) – If you create a resource-based policy, you must indicate the account, user, role, or federated user to which you would like to allow or deny access. If you are creating an IAM permissions policy to attach to a user or role, you cannot include this element. The principal is implied as that user or role.
6. Action – Include a list of actions that the policy allows or denies.
7. Resource (Required in only some circumstances) – If you create an IAM permissions policy, you must specify a list of resources to which the actions apply. If you create a resource-based policy, this element is optional. If you do not include this element, then the resource to which the action applies is the resource to which the policy is attached.
8. Condition (Optional) – Specify the circumstances under which the policy grants permission.








