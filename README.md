# Some notes used for this module
Create initial infra with terraform: https://docs.microsoft.com/en-us/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure

Store terraform state in azure cloud: https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli

install prometheus stack using ansible: https://xavier-pestel.medium.com/ansible-how-to-create-roles-and-install-prometheus-grafana-and-node-exporter-28c142904541


# Individual questions
- What modification should be done to the terraform code in order to deploy three virtual machines instead of one?  
**A:** We should use the `count` meta-argument to create three instances from the same resource.

- During the group assignment, various files will have to be downloaded from the internet (the Prometheus stack binaries), is there a way for ansible to be sure that these files are the originals and have not been tampered with?  
**A:** We should use ansible's `get_url` module, which has a built-in `checksum` argument that allows to validate if the checksum of the file matches with the known, published hashes.

- What is metric scraping?  
**A:** Metric scraping is the process of getting data (metrics) from a target that is exposing this information via a public endpoint.