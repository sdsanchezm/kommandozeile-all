# Azure relevant work documentation

## Azure quick start templates:

- [https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.web]


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


## Pipeline Explanation

Detailed explanation:

### 1. **Pipeline Name**

```
name: $(Build.BuildNumber)_$(Build.SourceBranchName)
```

- **Purpose**: This sets the name of the build. It combines the build number (```
  $(Build.BuildNumber)
  ```

  ) and the source branch name (```
  $(Build.SourceBranchName)
  ```

  ) to create a unique identifier for each build. This helps in tracking builds easily.

### 2. **Trigger**

```
trigger:
- main
```

- **Purpose**: This specifies that the pipeline should be triggered automatically when there are changes pushed to the ```
  main
  ```

   branch. It ensures that the pipeline runs for every commit made to this branch.

### 3. **Pool**

```
pool:
  vmImage: 'windows-latest'  # Windows agent pool
```

- **Purpose**: This defines the environment in which the pipeline will run. Here, it specifies that the pipeline will use a Microsoft-hosted agent running the latest version of Windows. This is important for compatibility with Windows-based applications.

### 4. **Variables**

```
variables:
  buildConfiguration: 'Release'
  solution: '**/*.sln'
  outputDir: '$(Build.ArtifactStagingDirectory)/publish'
  testResultsDir: '$(Build.ArtifactStagingDirectory)/test-results'
```

- **Purpose**: This section defines reusable variables that can be referenced throughout the pipeline:- ```
    buildConfiguration
    ```

    : Specifies the build configuration (e.g., ```
    Release
    ```

     or ```
    Debug
    ```

    ).
  - ```
    solution
    ```

    : A glob pattern to locate the solution files in the repository.
  - ```
    outputDir
    ```

    : The directory where build artifacts will be published.
  - ```
    testResultsDir
    ```

    : The directory where test results will be stored.

### 5. **Stages**

```
stages:
- stage: Build
  displayName: 'Build Stage'
```

- **Purpose**: This section defines the stages of the pipeline. Each stage can contain one or more jobs. The first stage is named ```
  Build
  ```

  , and it is given a friendly display name for clarity in the Azure DevOps UI.

### 6. **Jobs**

```
jobs:
- job: Build_Job
  displayName: 'Build and Test'
```

- **Purpose**: This defines a job within the ```
  Build
  ```

   stage. A job is a collection of steps that run sequentially on the same agent. The job is named ```
  Build_Job
  ```

   and has a display name for better readability.

### 7. **Steps**

```
steps:
```

- **Purpose**: This section contains the individual tasks that will be executed as part of the job.

### 8. **Tasks**

```
- task: DotNetCoreCLI@2
  displayName: 'Restore NuGet Packages'
  inputs:
    command: 'restore'
    projects: '$(solution)'
```

- **Purpose**: Each task represents a specific action to be performed. In this case, the ```
  DotNetCoreCLI@2
  ```

   task is used to restore NuGet packages for the .NET solution. The ```
  displayName
  ```

   provides a user-friendly name for the task.

### 9. **Build Solution Task**

```
- task: DotNetCoreCLI@2
  displayName: 'Build Solution'
  inputs:
    command: 'build'
    projects: '$(solution)'
    arguments: '--configuration $(buildConfiguration)'
```

- **Purpose**: This task builds the .NET solution using the specified configuration (e.g., ```
  Release
  ```

  ). It compiles the code and prepares it for testing.

### 10. **Run Unit Tests Task**

```
- task: DotNetCoreCLI@2
  displayName: 'Run Unit Tests'
  inputs:
    command: 'test'
    projects: '$(solution)'
    arguments: '--configuration $(buildConfiguration) --logger trx --results-directory $(testResultsDir)'
```

- **Purpose**: This task runs unit tests on the solution. It specifies the output format for test results (```
  trx
  ```

  ) and the directory where the results will be stored.

### 11. **Publish Test Results Task**

```
- task: PublishTestResults@2
  displayName: 'Publish Test Results'
  inputs:
    testResultsFormat: 'VSTest'
    testResultsFiles: '**/*.trx'
    testRunTitle: 'Unit Tests'
```

- **Purpose**: This task publishes the test results to Azure DevOps, allowing you to view the results in the pipeline summary. It specifies the format of the test results and the title for the test run.

### 12. **Generate Build Artifacts Task**

```
- task: PowerShell@2
  displayName: 'Generate Build Artifacts'
  inputs:
    targetType: 'inline'
    script: |
      Write-Host "Publishing build artifacts..."
      dotnet publish $(solution) --configuration $(buildConfiguration) --output $(outputDir)
```

- **Purpose**: This PowerShell task generates the build artifacts by publishing the application. The inline script uses the ```
  dotnet publish
  ```

   command to create the output files in the specified directory.

### 13. **Publish Artifacts Task**

```
- task: PublishBuildArtifacts@1
  displayName: 'Publish Artifacts'
  inputs:
    PathtoPublish: '$(outputDir)'
    ArtifactName: 'drop'
```

- **Purpose**: This task publishes the generated artifacts to the Azure DevOps server, making them available for download or deployment. The artifacts are stored under the name ```
  drop
  ```

  .

### 14. **Deploy Stage**

```
- stage: Deploy
  displayName: 'Deploy Stage'
  dependsOn: Build
  condition: succeeded()
```

- **Purpose**: This defines a second stage named ```
  Deploy
  ```

  , which depends on the successful completion of the ```
  Build
  ```

   stage. The ```
  condition: succeeded()
  ```

   ensures that this stage only runs if the previous stage was successful.

### 15. **Deploy Job**

```
jobs:
- job: Deploy_Job
  displayName: 'Deploy to Dev'
```

- **Purpose**: This job is defined within the ```
  Deploy
  ```

   stage and is responsible for deploying the application. It has a display name for clarity.

### 16. **Download Artifacts Task**

```
- task: DownloadBuildArtifacts@0
  displayName: 'Download Artifacts'
  inputs:
    buildType: 'current'
    downloadType: 'single'
    artifactName: 'drop'
    downloadPath: '$(System.ArtifactsDirectory)'
```

- **Purpose**: This task downloads the artifacts published in the ```
  Build
  ```

   stage. It specifies the artifact name (```
  drop
  ```

  ) and the directory where the artifacts will be downloaded.

### 17. **Simulated Deployment Task**

```
- task: PowerShell@2
  displayName: 'Deploy Application (Simulated)'
  inputs:
    targetType: 'inline'
    script: |
      Write-Host "Simulating deployment..."
      Get-ChildItem -Path '$(System.ArtifactsDirectory)/drop' -Recurse | 
        ForEach-Object { Write-Host "Deploying file: $($_.FullName)" }
```

- **Purpose**: This PowerShell task simulates the deployment of the application. It lists the files that would be deployed, allowing you to verify the deployment process. In a real scenario, this would be replaced with actual deployment logic (e.g., deploying to Azure App Service).

---

### Summary

This pipeline is structured to automate the build and deployment process for a .NET application.
