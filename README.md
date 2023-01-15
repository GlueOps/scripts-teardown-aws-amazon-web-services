# scripts-teardown-aws-amazon-web-services\

This teardown is HIGHLY descructive. Please use caution or ask for help if you aren't sure what you are doing.

## Directions

- Prepare a configuration. Run `cp aws-nuke.yaml.tpl aws-nuke.yaml` and start updating the `aws-nuke.yaml` with all your configs.
- Download `aws-nuke` with

```bash
wget https://github.com/rebuy-de/aws-nuke/releases/download/v2.21.2/aws-nuke-v2.21.2-linux-amd64.tar.gz && tar -xvf aws-nuke-v2.21.2-linux-amd64.tar.gz && rm aws-nuke-v2.21.2-linux-amd64.tar.gz && mv aws-nuke-v2.21.2-linux-amd64 aws-nuke
```

- Set your environment variables

```bash
export AWS_ACCESS_KEY_ID=XXXXXXXXXXXXXXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXX
export AWS_DEFAULT_REGION=us-west-2
```

- Run the nuke

```bash
./aws-nuke -c aws-nuke.yaml --no-dry-run --force
```

**NOTE: sometimes it gets hungup, just kill the task with `ctrl+c` and run it again a second time.**
