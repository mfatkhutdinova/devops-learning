# DataBase

#### DynamoDB 
DynamoDB is a fast and flexible non-relational database service for any scale. It can scale with no downtime, it can process millions of requests per second, and is fast and consistent in performance.

#### Redshift
Based on Postgresql but not for OLTP  
OLAP - online analytical processing   
Columnar storage of data (instead of row based)  
BI tools such as Tableau integrate with it  

#### Amazon EMR
Elastic MapReduce  
EMR helps creating Hadoop clusters (Big Data) to analyze and process vast amount of data  
Supports Apache Spark, HBase, Presto, Flink   
Use cases: data processing, machime learning, web indexing, big data  

#### Amazon Athena
Serverless quesry service to perform analytics against S3  
Use standart SQL language  
Use cases: BI, analytics, reporting  
Exam TIP: amalyze data in S3 using serverless SQL -- use Athena  

#### Amazon QuickSight
Serverless machine learning-powered BI service create interactive Dashboard  
Use cases: Business analytics, building vizualizations, perform ad-hoc analytics, get business insight using data  
Integrated with RDS, Aurora, Athena, Redshift, S3  

#### DocumentDB
DocumentDB is the same for MongoDB (which is NO Sql DB)  
MongoDB is  used to store. query anf index JSON data  

#### Amazon Neptune
Fully managed graph db  
A popular Graph dataset would be a social network  
Greate for knowledge graph (Wikipedia), fraud detection, recommendation engines, social networking  

#### Amazon QLDB
QLDB - stands for "Quantum Ledger Database"  
A ledger is a book recording financial transactions  
Used to review history of all changes made to your application data over time  
Immutable system: no entry can be removed or modified, cryptographically verifiable  
Difference with Amazon Managed Blockchain: no decentralization component, in accordance with financial regulation rules  

#### Amazon Managed Blockchain
Blockchain makes it possible to build applications where multiple parties can execute transactions without the need for a trusted, central authority.  
Is managed service to:  
- join public blockchain network   
- create your own scalable private network  

#### AWS Glue
Managed extract, transform, and load (ETL) service  
Useful to prepare and transform data for analytics   
Fully serverless service   
The AWS Glue Data Catalog is a central repository to store structural and operational metadata for all your data assets.  
 
#### DMS - Database migration service 
Quickly and securely migrate databases to AWS, resilient, self healing   
The source database remains available during the migration  

#### Amazon DynamoDB Accelerator (DAX)
Is a fully managed, highly available, in-memory cache for Amazon DynamoDB that delivers up to a 10 times performance improvement—from milliseconds to microseconds—even at millions of requests per second.

#### Summary:
Relational db - OLTP: RDS & Aurora (SQL)  
Differences between Multi-AZ, Read Replicas, Multi-Region  
In-Memory Database: ElasticCache  
Key/Value db: DynamoDB (serverless) & DAX (cache for DynamoDB)  
Warehouse - OLAP: Redshift (SQL)  
Hadoop Cluster: EMR   
Athena: query data on Amazon S3 (serverless & SQL)  
QuickSight: dashboards on your data (serverless)  
DocumentDB: "Aurora for MongoDB" (JSON - NoSQL database)  
AmazonQLDB: Financial Transactions Ledger (immutable journal, cryptoghraphically verifiable)  
Amazon Managed Blockchain: managed Hyperledger Fabric & Euthereum Blockchains  
Glue: Managed ETL (Extract Transform Load) and Data Catalog service  
Database Migration: DMS  
NeptuneL grapch database  
