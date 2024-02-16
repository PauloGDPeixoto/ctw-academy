# Group challenge
**Due by EOD**, only one submission per group, sent by email to Paulo Peixoto (check pulsar or teams for email address):
- Deploy the Prometheus stack (Prometheus, Alertmanager and Grafana), using Terraform and Ansible on a single `Standard_D2s_v3` VM instance; [x]
- The Terraform code should be configured to use the cloud provider to store the `tfstate` file;
- Only the ports required for a user to connect to the three components of the stack should be accessible; [x]
- After the stack is deployed, import the three dashboards found in the `resources` folder into Grafana;[x]
- Try to keep the manual steps to an absolute minimum. FYI, the minimum will be 5, out of which, running Terraform and Ansible are two. [x]


# Individual questions
- What modification should be done to the terraform code in order to deploy three virtual machines instead of one?  
    - We can deploy three virtual machines by using the count attribute in the resource for the vitual machine and assign it 3. Optionally, we can use count.index inside the "name" to provide a unique name for each vm. The following code snippet exemplifies this:
    ```terraform
    resource "azurerm_linux_virtual_machine" "myterraform" {
        ...
        count = 3
        name = "vm-${count.index + 1}"
        ....
    }
    ```

    - We can also configure a network interface and public IP address for each vm also using the "count" and "count.index".
 

- During the group assignment, various files will have to be downloaded from the internet (the Prometheus stack binaries), is there a way for ansible to be sure that these files are the originals and have not been tampered with?

    - We can check the integrity of the downloaded files by comparing the website's provided checksums with the one's we calculate from the files. If they are the same, then the files are likely to be authentic and have not been tempered with. In Ansible, the "get_url" module already includes an option to already compare the checksums.

- What is metric scraping?
    - Metric scraping refers to the process of collecting metrics from sources/targets in systems or applications. In the context of software engineering the metrics are commonly used to measure and track the performance, liveness, health and behaviors of the system/application.

# Instructions Manual
- execute /scripts/storage_account_script.sh

- cd terraform

    - terraform init

    - terraform apply

- Return

- cd ansible
    - ansible-galaxy collection install -r playbooks/roles/install_galaxy_dependencies/requirements/main.yml 
    
    - ansible-playbook -i inventory/ctwacademy playbooks/configure_prometheus.yaml

