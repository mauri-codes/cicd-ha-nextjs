# CI/CD Pipeline for a HA nextjs Application
This code is a template for a nextjs or nodejs application. It uses autoscaling and a load balancer for High Availability and both Codedeploy and Codepipeline for Continuous Integration and Deployment.

## Infrastructure

An autoscaling group behind a load balancer in 3 different availability zones.

The CodeDeploy agent is installed in every instance, and makes sure the instances are configured according to the Deployment Group that was created.

## CodePipeline

CodePipeline has 3 stages
1. Source Stage, which is linked to a github account, repo and branch
2. Infrastructure Deployment, that deploys the templates in nextjs-app (the autoscaling group and load balancer) and codedeploy (the codedeploy bit)
3. Cluster Deployment, which will redeploy the instances with the newest version of the UI application inside nextjs-app

## Deployment
You'll need to have a Secrets Manager Secret called github-pipeline with the following parameters
- owner
- repo
- branch
- token

Then deploy the network first
```
./deploy.sh -p network -d
```
And finally deploy the pipeline, it will automatically deploy the codedeploy and nextjs-app stacks as well
```
./deploy.sh -p pipeline -d
```
