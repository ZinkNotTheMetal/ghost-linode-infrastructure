# Personal Linode setup

## Getting started

In order to begin we need to get a Personal Access Token in order to communicate with my instance of Linode.

### Generating an API Token for Linode

1. Login to Linode
2. Go to My Profile at the top right
3. Select API Tokens Tab:
4. Create Personal Access Token (choose correct rights)
5. Click Generate

### Generating an S3 bucket to store .tfstate file in Linode

Well again, let's do things the right way and have terraform set this up doing an init-state

I'll create a folder under this `.infrastructure/tf/linode/init-state` it's entire purpose is to create the S3 bucket for us

1. Create the main.tf
2. Get the Personal Access Token that you generated above
3. Navigate to the init-state folder in the project
4. Let's add the PAT using export

    ```bash
    export LINODE_TOKEN=<paste-token-here>
    ```

5. Run the following commands to setup the bucket using terraform
   1. `terraform init`
   2. `terraform plan` - after this runs make sure only one resource is being created
   3. `terraform apply`

Next, because we want to do things the right way we need a place to store the tfstate file. Now because this is a chicken before the egg situation. We are going to create a Linode bucket manually that will host our tfstate file

### Manually create a bucket for tfstate in linode

## Blogging platform!