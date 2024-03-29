##  module.vpc.public_subnets is tuple with 1 element
I got this error while trying to access the subnets created using the `module vpc`. Here is the code I have below:

```js
resource "aws_route_table_association" "private_subnet_workspace_2" {
  # Access the subnet ID dynamically using the index
  subnet_id = module.vpc.private_subnets[3].id
  route_table_id = aws_route_table.private_subnet_main_3.id
}
```

Here is the error that Terraform prompted!

```sh
│ 
│   on route_tables.tf line 83, in resource "aws_route_table_association" "private_subnet_workspace_2":
│   83:   subnet_id = module.vpc.private_subnets[3].id
│     ├────────────────
│     │ module.vpc.private_subnets[3] is a string
│ 
│ Can't access attributes on a primitive-typed value (string).
```
To fix the error, I realized that the `module.vpc` resources created already seems to be a list of ID strings, not objects, and so there is no need to access .id: the string value is already that ID. So I passed the `subnet_id` without the id, just like this `subnet_id = module.vpc.private_subnets[3]`.


```powershell
New-ADUser : Unable to contact the server. This may be because this server does not exist, it is currently down, or it does not have the Active Directory Web Services running.
At line:1 char:1
+ New-ADUser -Name "dr.olawoyin" -Enabled $true -AccountPassword (Conve ...
+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ResourceUnavailable: (:) [New-ADUser], ADServerDownException
    + FullyQualifiedErrorId : ActiveDirectoryServer:0,Microsoft.ActiveDirectory.Management.Commands.NewADUser
```

Connected to the instance via system manager, tried to create a user in the directory, I tried to ping the DNS SERVER, it was succesful

```sh
PS C:\Windows\system32> ping 10.0.4.109

Pinging 10.0.4.109 with 32 bytes of data:
Reply from 10.0.4.109: bytes=32 time<1ms TTL=128
Reply from 10.0.4.109: bytes=32 time<1ms TTL=128
Reply from 10.0.4.109: bytes=32 time<1ms TTL=128
Reply from 10.0.4.109: bytes=32 time<1ms TTL=128
```







```sh
aws ssm start-automation-execution \
--document-name "AWS-CreateDSManagementInstance" \
--document-version "\$DEFAULT" \
--parameters '{
  "DirectoryId":["d-9067fc87b5"],
  "Tags":[
    "{\"Key\":\"Description\",\"Value\":\"Created by AWS Systems Manager Automation\"}",
    "{\"Key\":\"Created By\",\"Value\":\"AWS Systems Manager Automation\"}"
    ],
    "KeyPairName":["ox-2023-aug"],
    "IamInstanceProfileName":["AmazonSSMDirectoryServiceInstanceProfileRole"],
    "SecurityGroupName":["AmazonSSMDirectoryServiceSecurityGroup"],
    "AmiId":["{{ssm:/aws/service/ami-windows-latest/Windows_Server-2019-English-Full-Base}}"],"InstanceType":["t3.medium"],
    "MetadataOptions":["{\"HttpEndpoint\":\"enabled\",\"HttpTokens\":\"optional\"}"]
    }' \
--region us-east-1
```

