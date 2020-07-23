# CI/CD Pipeline for a HA nextjs Application
This code is a template for a nextjs or nodejs application. It uses autoscaling and a load balancer for High Availability and both Codedeploy and Codepipeline for Continuous Integration and Deployment.

## Infrastructure

An autoscaling group behind a load balancer in 3 different availability zones.

The CodeDeploy agent is installed in every instance, and makes sure the instances are configured according to the Deployment Group that was created.

![infrastructure](https://user-images.githubusercontent.com/16513413/88126482-98adff80-cb9f-11ea-97a7-f2ae428690e3.jpeg)

## CodePipeline

CodePipeline has 3 stages
**1. Source Stage**, which is linked to a github account, repo and branch
**2. Infrastructure Deployment**, that deploys the templates in nextjs-app (the autoscaling group and load balancer) and codedeploy (the codedeploy bit)
**3. Cluster Deployment**, which will redeploy the instances with the newest version of the UI application inside nextjs-app

![Pipeline](https://user-images.githubusercontent.com/16513413/88241682-d6229380-cc58-11ea-95ab-0c6b9b8549cb.jpeg)

## Deployment
You'll need to have a Secrets Manager Secret called github-pipeline with the following parameters
- owner
- repo
- branch
- token

You need an s3 bucket for the deployments, it should be already created and you can replace it in the params section of the templates

Deploy the network first
```
./deploy.sh -p network -d
```
And finally deploy the pipeline, it will automatically deploy the codedeploy and nextjs-app stacks as well
```
./deploy.sh -p pipeline -d
```
