# Linode Documentation

## Setting up communication for Terraform and Linode

In order to begin we need to get a Personal Access Token in order to communicate with my instance of Linode.

### Generating an API Token for Linode

1. Login to [Linode](https://linode.com)
2. Go to My Profile at the top right
3. Select API Tokens Tab
4. Create Personal Access Token (choose correct rights)
5. Click Generate

Note: Ensure to save this into a safe location, you will NOT be able to get this value back later

## Setting up a Object Storage (S3 Bucket protocol in Linode) for .tfstate file

We'll first create an init-state folder that will communicate with linode and setup our tfstate container

1. Create a new folder under the project `.infrastructure/tf/linode/init-state` it's entire purpose is to create the S3 bucket for us for the main project
2. We then create a `main.tf` file that will be filled in minimally
3. Navigate to the init-state folder in the project
4. Let's add the PAT using export

   ```bash
   export LINODE_TOKEN=<paste-token-here>
   ```

5. Let's go ahead and add the commands we need to package.json so we don't have to do navigation
6. After those are created run the following command to setup the S3 bucket
7. Run `npm run init:terraform` to instantiate our bucket

## Setting up the credentials for the main project

I want the ability to save the credentials locally and when I push this to GitHub for the public eyes they will not be able to see my keys!

1. Create a folder `/src/config/.linode/`
2. This will have two files `pat.credentials` and `bucket.credentials`
3. Add `**/*.credentials` to .gitignore so we don't commit them accidentally!
4. In `bucket.credentials`

    ```text
    [linode-s3]
    aws_access_key_id=<LINODE_SECRET_ID>
    aws_secret_access_key=<LINODE_SECRET_KEY>
    ```

5. In `pat.credentials`

    ```text
    pat_token = <LINODE_PAT_TOKEN>
    ```

This will allow me to store them locally and have them in a centralized place on a windows / mac machine.