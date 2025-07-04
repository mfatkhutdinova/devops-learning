# Deploying and Managing Infrastructure at Scale Section

#### AWS Elastic Beanstalk 
- Elastic Beanstalk is a developer cetric view of deploying an application on AWS
- It uses all the component's: EC2, ASG, ELB, RDC, etc...
- But it's all in one view that's easy to make sense of!
- We still full control over the configuration 

Beanstalk = Platform as a Service (PaaS)  

#### AWS CodePipeline 
CodeCommit -> CodeBuild -> CodeDeploy -> Elastic Beanstalk
Basis for CICD 

"Orchestration of pipeline" == AWS CodePipeline

#### AWS CodeArtifact
- Software packages depend on each other to be built, and new ones are created   
- Storing and retrieving these dependencies is called artifact management  

#### AWS CodeStar 
- Unified UI to easily manage software development activities in one place   
- "Quick way" to get ctarted to  correctly set-up CodeCommit, CodePipeline, ..ect  

AWS CodeBuild is a fully managed continuous integration service that compiles source code, runs tests, and produces software packages that are ready to deploy. With CodeBuild, you don’t need to provision, manage, and scale your own build servers, it is serverless.  
AWS CodeDeploy is a service that automates code deployments to any instance, including Amazon EC2 instances and instances running on-premises.  
AWS CodeCommit is a secure, highly scalable, managed source control service that makes it easier for teams to collaborate on code. It also provides software version control.  
AWS CloudFormation templates are JSON or YAML-formatted text files. They are declarations of the AWS resources that make up a stack.   

#### AWS Cloud9
- AWS Cloud9 is a cloud IDE for writting, running and debugging code  
- AWS Cloud9 also allows for code collaboration in real-time (pair programming)  

#### AWS System Manager (SSM)
- helps manage EC2 and On-Premises systems at scale   
- patching automation for enhanced compliance   
- run commands across an entire fleet of services  
- store parameter configuration with the SSM Parameter Store  

AWS OpsWorks is a configuration management service that provides managed instances of Chef and Puppet.  

The AWS Cloud Development Kit (AWS CDK) is an open source software development framework to define your cloud application resources using familiar programming languages.  

!! "A way to patch your fleet of EC2 instances or On-Premises servers" == SSM  

####  Deployment - Summary
• CloudFormation: (AWS only)  
• Infrastructure as Code, works with almost all of AWS resources  
• Repeat across Regions & Accounts  
• Beanstalk: (AWS only)  
  - Platform as a Service (PaaS), limited to certain programming languages or Docker  
  - Deploy code consistently with a known architecture: ex, ALB + EC2 + RDS  
• CodeDeploy (hybrid): deploy & upgrade any application onto servers  
• Systems Manager (hybrid): patch, configure and run commands at scale  
• OpsWorks (hybrid): managed Chef and Puppet in AWS  
• CodeCommit: Store code in private git repository (version controlled)  
• CodeBuild: Build & test code in AWS  
• CodeDeploy: Deploy code onto servers  
• CodePipeline: Orchestration of pipeline (from code to build to deploy)  
• CodeArtifact: Store software packages / dependencies on AWS  
• CodeStar: Unified view for allowing developers to do CICD and code  
• Cloud9: Cloud IDE (Integrated Development Environment) with collab  
• AWS CDK: Define your cloud infrastructure using a programming language  
