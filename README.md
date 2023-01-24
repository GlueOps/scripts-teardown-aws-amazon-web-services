# scripts-teardown-aws-amazon-web-services\

This teardown is HIGHLY descructive. Please use caution or ask for help if you aren't sure what you are doing.

## Directions

- Prepare a configuration. Run `cp aws-nuke.yaml.tpl aws-nuke.yaml` and start updating the `aws-nuke.yaml` with all required configuration values.  The template has comments describing the values that must be updated.
- Console Login to the account targeted for resource deletion
  - Navigate to IAM page, create a User with the `Administrator Access` policy attached if one doesn't exist.  **_Be sure to attach the `Administrator Access` policy directly vs adding the user to the `Administrator` group. This is a result of how AWS Nuke works and should not be considered a recommended practice._**
  - Create a new set of API Credentials, some of the values are needed in the configuration file and others are needed as environment variables
- Download `aws-nuke` with

```bash
wget https://github.com/rebuy-de/aws-nuke/releases/download/v2.21.2/aws-nuke-v2.21.2-linux-amd64.tar.gz && tar -xvf aws-nuke-v2.21.2-linux-amd64.tar.gz && rm aws-nuke-v2.21.2-linux-amd64.tar.gz && mv aws-nuke-v2.21.2-linux-amd64 aws-nuke
```

- Set the following environment variables, with the values from the API credentials created above.

```bash
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXX
export AWS_DEFAULT_REGION=us-west-2
```

- Run the nuke

```bash
./aws-nuke -c aws-nuke.yaml --no-dry-run --force
```

- Delete the IAM users for the account, whether created for this nuke process or when building the account

**NOTES:<br>** 
- Often the task hangs, just kill the task with `ctrl+c` and run it again a second time.
- If you encounter the following error, when running `aws-nuke`: `Error: The specified account doesn't have an alias. For safety reasons you need to specify an account alias. Your production account should contain the term 'prod'.`, log in to the account and create an alias in the Console UI, on the `IAM Dashboard` on the left rail `AWS Account`.
