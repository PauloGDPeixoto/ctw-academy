# Prometheus stack deployment
## Instructions:
- Run the `1-create-storage-account.sh` script inside the `terraform` folder to create the necessary resources to store the terraform state in the cloud provider;
- Run terraform;
- Run the `update_hosts.sh` script inside the `ansible/scripts` folder to update the ansible hosts file with all existing instances in the resource group;
- Run the `deploy_prometheus.yaml` ansible playbook.

This will deploy the prometheus stack in the instance created by this terraform code, and node_exporter in every instance inside the resource group.