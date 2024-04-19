This module creates a Microsoft AD, with the AWS Directory Service, the Directory Edition is `small` and it spans across 2 AZ for redundancy. Also, Cloudwatch log is enabled for monitoring of the AD. An Administrator is created as well as the password. 

to create users, aws advise to spin up this https://docs.aws.amazon.com/directoryservice/latest/admin-guide/ms_ad_install_ad_tools.html


aws ssm start-automation-execution --document-name "AWS-CreateDSManagementInstance" --document-version "\$DEFAULT" --parameters '{"DirectoryId":["d-9067fd6644"],"Tags":["{\"Key\":\"Description\",\"Value\":\"Created by AWS Systems Manager Automation\"}","{\"Key\":\"Created By\",\"Value\":\"AWS Systems Manager Automation\"}"],"KeyPairName":["unilorin.com.edu.ng-MSAD"],"IamInstanceProfileName":["AmazonSSMDirectoryServiceInstanceProfileRole"],"SecurityGroupName":["AmazonSSMDirectoryServiceSecurityGroup"],"AmiId":["{{ssm:/aws/service/ami-windows-latest/Windows_Server-2019-English-Full-Base}}"],"InstanceType":["t3.medium"],"RemoteAccessCidr":["10.0.0.0/16"],"MetadataOptions":["{\"HttpEndpoint\":\"enabled\",\"HttpTokens\":\"optional\"}"]}' --region us-east-1




  register-workspace-directory
--directory-id d-9067fd6644 \
--subnet-ids subnet-039425011fe353851 subnet-083332807a973bcf2 \
--enable-work-docs true \
--enable-self-service true


aws workspaces register-workspace-directory \
    --directory-id d-9067fd61bd \
    --subnet-ids subnet-0258cd1f06f2c248b subnet-0cc7fc52a72f54299 \
    --enable-work-docs \
    --enable-self-service

 
aws workdocs  create-user \
    --organization-id d-9067fd6644 \
    --username oxblixxxx \
    --email-address phamust1111@gmail.com \
    --given-name pelumi \
    --surname mustapha \
    --password

An error occurred (UnauthorizedResourceAccessException) when calling the CreateUser operation: Principal [arn:aws:iam::432813148866:root] is not allowed to execute [workdocs:CreateUser] on the resource
