This terraform module deploys the infrastructure for the `workspace` and the `directory`. Creates the :

- vpc
- security group
- s3(stores vpc flow logs)

For now! Considering cost, a single NATGW is created which isn't advisable for HA.


![infrastructure architecture](../../images/infra_1.png)
