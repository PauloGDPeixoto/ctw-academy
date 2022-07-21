# Prometheus stack deployment
## Instructions:
- Run terraform
- Run the `update_hosts.sh` script inside the `ansible/scripts` folder
- Run the `deploy_prometheus.yaml` ansible playbook

This will deploy the prometheus stack in the instance created by this terraform code, and node_exporter in every instance inside the resource group.