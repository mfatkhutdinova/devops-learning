# Advanced Identity

AWS STS (SecurityToken Service)  
 • Enables you to create temporary, limited- privileges credentials to access your AWS resources  
 • Short-term credentials: you configure expiration period  

Use cases:  
 • Identity federation: manage user identities in external systems, and provide them with STS tokens to access AWS resources  
 • IAM Roles for cross/same account access  
 • IAM Roles for Amazon EC2: provide temporary credentials for EC2 instances to access AWS resources  

Amazon Cognito (simplified)  
• Identity for your Web and Mobile applications users (potentially millions)  
• Instead of creating them an IAM user, you create a user in Cognito  

AWS IAM Identity Center (successor to AWS Single Sign-On)  
One login (single sign-on) for all your  
• AWS accounts in AWS Organizations  
• Business cloud applications (e.g., Salesforce, Box, Microsoft 365, …)  
• SAML2.0-enabled applications   
• EC2 Windows Instances  

Advanced Identity - Summary  
• IAM  
  - Identity and Access Management inside your AWS account  
  - For users that you trust and belong to your company  

• Organizations: Manage multiple accounts  
• Security Token Service (STS): temporary, limited-privileges credentials to access AWS resources  
• Cognito: create a database of users for your mobile & web applications  
• Directory Services: integrate Microsoft Active Directory in AWS  
• IAM Identity Center: one login for multiple AWS accounts & applications  
