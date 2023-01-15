account-blocklist:
- "0123456789" # Keep listing any accounts you want to ensure do NOT get touched. If you did this properly and are using IAM credentials that only have access to your sub account then this is less important and could be left with this default/invalid value

accounts:
  12345678910: # This `12345678910` account ID will have most, if not all of it's resources DESTROYED. This will allow you to redeploy the glueops stack cleanly using the same sub account.
    presets:
      - common #these presets basically say exclude certain things, these are things we want to keep so we can easily provision again into this account later
  
presets:
  common:
    filters:
      IAMRole:
      - type: regex
        value: '.*OrganizationAccountAccessRole.*'
      IAMRolePolicyAttachment:
      - type: regex
        value: '.*OrganizationAccountAccessRole.*'
      OpsWorksUserProfile:
      - type: regex
        value: '.*OrganizationAccountAccessRole.*'
      IAMUser:
      - "glueops-deployment-svc-account-name" # Update `glueops-deployment-svc-account-name` to whatever your IAM user you created is called
      IAMUserPolicyAttachment:
      - "glueops-deployment-svc-account-name -> AdministratorAccess" # Update `glueops-deployment-svc-account-name` to whatever your IAM user you created is called
      IAMUserAccessKey:
      - "glueops-deployment-svc-account-name -> ABCDEFGHIJKLMNOPQRST" #Update `glueops-deployment-svc-account-name` to whatever your IAM user you created is called AND change `ABCDEFGHIJKLMNOPQRST` to whatever the AccessKey ID actually is from when you created it.



regions: #this regions list was last updated on April 2, 2022.
- global
- us-west-2