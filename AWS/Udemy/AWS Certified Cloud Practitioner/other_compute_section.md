# Other Compute Section

#### ECS = Elastic Container Service
Launch Docker containers on AWS
AWS takes care of starting/stopping containers

#### Fargate 
Launch Docker containers on AWS
You do not provision the infreastracture (no EC2 istances to manage) - simpler!
AWS just runs containers for you based on the CPU/RAM you need

#### ECR = Elastic Container Registry 
Private Docker Registry on AWS
This is where you store your Docker images so they can be run by ECS or Fargate

Serverless is a new paradigm in which the deveopers don;t have to manage servers anymore  
They just deploy code   
Serverless == FaaS (Function as a Service)  
Serverless does not mean there are no servers...  
It means you just don't manage/provision/see them  

#### AWS Lambda
Virtual functions - no servers to manage!  
Limited by time - short executions   
Run on-demand   
Scaling is automated   

Serverless CRON Job  
ClowdWatch Events EventBridge -> AWS Lambda Function Perform a task  

AWS Lambda pricing is based on calls and duration.  

Batch vs Lambda  
Lambda:  
- Time limit   
- Limited runtimes  
- Limited temprora disk space  

Batch:  
- No time limit 
- Any runtime as long as it's packaged as a Dockerimage
- Rely on EBS / instance store for disk space
- Relies on EC2 (can be managed by AWS)

Amazon Lightsail   
- Virtual servers, storage, databases, and networking 
- Low & predictable pricing 
- Can setup notifications and monitoring of your Lightsail resources 
- Has high availability but no auto-scaling, limited AWS integrations
Use cases:
- simple web applications
- websites 
- dev/test envs

#### Summary:
Docker: container technology to run applications
ECS: run Docker containers on EC2 instances 
Fargate:
- run docker containers without provisioning the infrastracture 
- serverless offering (no EC2 instances)
ECR: private docker images repository 
Batch: run batch jobs on AWS across managed EC2 instances 
Lghtsail: predictable & low pricing for simple application & DB stacks

#### Lambda Summary:
- lambda is serverless, functin as a Service, seamless scaling, reactive
- labbda billing: 
1. by the time x by the RAM provisioned
2. by the number of invocations
- language support
- Invocation time: u[ to 15 minutes
- API GatewayL expose Lambda functions as HTTP API
