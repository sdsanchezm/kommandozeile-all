# Azure relevant work documentation

## az commands:

- [https://learn.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest]
    - az CLI core commands
        - Azure CLI (az) is a command-line tool for managing Azure resources and services. Here are some commonly used Azure CLI commands and their categories:
        1. **Login and Authentication**:
            - `az login`: Log in to your Azure account.
            - `az logout`: Log out from the Azure CLI.
            - `az account list`: List Azure subscriptions.
            - `az account set`: Set the current subscription.

        2. **Resource Management**:
            - `az group create`: Create a new resource group.
            - `az group delete`: Delete a resource group and its resources.
            - `az resource list`: List Azure resources.
            - `az resource show`: Get details about a specific resource.
            - `az resource create`: Create a new Azure resource.
            - `az resource delete`: Delete an Azure resource.
            - `az resource update`: Update an Azure resource.

        3. **Virtual Machines**:
            - `az vm create`: Create a new virtual machine.
            - `az vm start`: Start a virtual machine.
            - `az vm stop`: Stop a virtual machine.
            - `az vm deallocate`: Deallocate a virtual machine.
            - `az vm list`: List virtual machines.

        4. **Azure App Service**:
            - `az webapp create`: Create a new Azure Web App.
            - `az webapp list`: List Azure Web Apps.
            - `az functionapp create`: Create an Azure Function App.
            - `az functionapp list`: List Azure Function Apps.

        5. **Azure SQL Database**:
            - `az sql server create`: Create an Azure SQL Server.
            - `az sql server list`: List Azure SQL Servers.
            - `az sql db create`: Create an Azure SQL Database.
            - `az sql db list`: List Azure SQL Databases.

        6. **Storage**:
            - `az storage account create`: Create an Azure Storage Account.
            - `az storage account list`: List Azure Storage Accounts.
            - `az storage container create`: Create a blob container in a Storage Account.
            - `az storage container list`: List blob containers.

        7. **Networking**:
            - `az network vnet create`: Create a Virtual Network.
            - `az network vnet list`: List Virtual Networks.
            - `az network nsg create`: Create a Network Security Group.
            - `az network nsg list`: List Network Security Groups.
            - `az network public-ip create`: Create a Public IP address.
            - `az network public-ip list`: List Public IP addresses.

        8. **Identity and Access Management (IAM)**:
            - `az ad user list`: List Azure Active Directory users.
            - `az ad group list`: List Azure AD groups.
            - `az role assignment list`: List role assignments.

        9. **Docker and Containers**:
            - `az acr create`: Create an Azure Container Registry.
            - `az acr list`: List Azure Container Registries.
            - `az acr login`: Log in to an Azure Container Registry.

        10. **For help:**:
            - `--help` or `az <command> --help`

## VMs

### CLI

- Create a VM in a Resource Group:
    ```
    az vm create --resource-group SuperRG1 --name vm1 --public-ip-sku Standard --image Ubuntu2204 --admin-username azureuser1 --generate-ssh-keys
    ```
- Configure nginx:
    ```
    az vm extension set --resource-group SuperRG1 --vm-name vm1 --name customScript --publisher Microsoft.Azure.Extensions --version 2.1 --settings '{"fileUris":["https://raw.githubusercontent.com/MicrosoftDocs/mslearn-welcome-to-azure/master/configure-nginx.sh"]}' --protected-settings '{"commandToExecute": "./configure-nginx.sh"}'
    ```


