# Elastic Load Balancing & Auto Scaling Groups Section

Vertical Scaling: Increase instance size (= scale up / down)  
• From: t2.nano - 0.5G of RAM, 1 vCPU  
• To: u-12tb1.metal – 12.3 TB of RAM, 448 vCPUs  

Horizontal Scaling: Increase number of instances (= scale out / in)  
• Auto Scaling Group  
• Load Balancer  

High Availability: Run instances for the same application across multi AZ  
• Auto Scaling Group multi AZ  
• Load Balancer multi AZ  

Scalability vs Elasticity (vs Agility)  
• Scalability: ability to accommodate a larger load by making the hardware stronger (scale up), or by adding nodes (scale out)    
• Elasticity: once a system is scalable, elasticity means that there will be some “auto-scaling” so that the system can scale based on the load. This is “cloud-friendly”: pay-per-use, match demand, optimize costs  
• Agility: (not related to scalability - distractor) new IT resources are only a click away, which means that you reduce the time to make those  resources available to your developers from weeks to just minutes.

Load balancers are servers that forward internet traffic to multiple servers (EC2 Instances) downstream.  

What’s an Auto Scaling Group?  
• In real-life, the load on your websites and application can change  
• In the cloud, you can create and get rid of servers very quickly  
• The goal of an Auto Scaling Group (ASG) is to:  
• Scale out (add EC2 instances) to match an increased load  
• Scale in (remove EC2 instances) to match a decreased load  
• Ensure we have a minimum and a maximum number of machines running  
• Automatically register new instances to a load balancer  
• Replace unhealthy instances  
• Cost Savings: only run at an optimal capacity (principle of the cloud)  

