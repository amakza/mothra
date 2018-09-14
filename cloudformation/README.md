# チェックリストのCloudformation

## 使用AWSサービス
* VPC
* RDS
* ECS

## Cloudformationテンプレートを流す順番
ネットワーク、データベース、コンテナの順にCloudformationテンプレートを流す

1. vpc.cf.yml
2. rds.cf.yml
3. ecs.cluster.cf.yml
4. ecs.task.definitions.cf.yml
5. ecs.role.cf.yml
6. ecs.instance.cf.yml
7. ecs.elb.yml
7. ecs.service.cf.yml