# Set-Up Steps for Tanzu-Workshop-PKS

The [Tanzu Workshop PKS](https://github.com/rm511130/Tanzu-Workshop-PKS) needs quite a lot of set-up for it to work. These instructions should help you with all the necessary steps.

## Step 1 - Manage-PKS Repo

- Using your Mac, check if you have the 
```
cd /work/manage-pks/gcp
```
directory derived from `https://github.com/rm511130/manage-pks` containing the following files:

```
01-playing-with-provisioning.sh
02-playing-with-accessing.sh
03-playing-with-cleaning-up.sh
04-playing-with-pks-delete-cluster.sh
manage-cluster	
manage-cluster-provision-v2
```
- If you don't have them, please: 
```
cd /work; rm -rf /work/manage-pks; 
git clone https://github.com/rm511130/manage-pks
cd /work/manage-pks/gcp
```

## Step 2 - PKS Environment

- You need a target PKS environment. In my case I have PKS 1.6.1 on GCP using OpsMan 2.8.3 and I also have Harbor 1.10.1 installed.
- My OpsMan URL is: `https://pcf.pks4u.com`           with credentials: `admin / password`
- My PKS API is at: `api.pks.pks4u.com`               with credentials: `pks_admin / password`
- Harbor is at:     `https://harbor.pks.pks4u.com`    with credentials: `admin / password`

- To get into my GCP account I use:  `Mac $ gcloud auth login` and `Mac $ open https://console.cloud.google.com/`
- My Godaddy `pks4u.com` domain nameservice has been delegated to `GCP` for management.

## Step 3 - AWS VMs

- I also have Ubuntu VMs (t2.medium) for each student running on AWS (N. Virginia) 
```
https://console.aws.amazon.com/
```

- These VMs are using my AMI: `ami-095d7d3a049233cf5`. They come with multiple CLIs: `pks, cf, helm, gcloud, wget, docker, git, jq, python3, ...`

- These VMs are accessible via the use of a [`pem`](https://github.com/rm511130/Tanzu-Workshop-PKS/blob/master/fuse.pem) or [`ppk`](https://github.com/rm511130/Tanzu-Workshop-PKS/blob/master/fuse.pem) key. For example:

```
ssh -i ~/Downloads/fuse.pem ubuntu@user1.pks4u.com
```

- Their Public IP addresses must match to the DNS entries on GCP: `user1.pks4u.com`, `user2.pks4u.com`, etc... to `user20`

- If the VMs have been `stopped`, you'll need to start them and copy their public IP addresses oover to GCP DNS entries. The public IP addresses do change every time you start the VM.

- You can cut&paste from the AWS console into an Excel Spreadsheet and the create the gcloud commands for the creation of the DNS entries.

- What are the `user#.pks4u.com` DNS entries already in place?

```
gcloud dns record-sets list --zone pks4u-zone --filter=Type=A | grep user..pks4u.com
```
```
user1.pks4u.com.               A     5    54.160.63.114
user2.pks4u.com.               A     5    54.237.216.69
user3.pks4u.com.               A     5    3.89.192.76
```

- Ideally, you should go imto `gcloud` and delete all these entries... it's just a few clicks. Otherwise the addition of the new IP addresses will fail.

- Here are the commands you will have to tweak to get the new IP addresses in place:

```
gcloud dns record-sets transaction start --zone=pks4u-zone
gcloud dns record-sets transaction add 35.36.111.222 --name=user3.pks4u.com --zone=pks4u-zone --ttl=5 --type=A
gcloud dns record-sets transaction add 35.36.111.223 --name=user4.pks4u.com --zone=pks4u-zone --ttl=5 --type=A
gcloud dns record-sets transaction add 35.36.111.224 --name=user5.pks4u.com --zone=pks4u-zone --ttl=5 --type=A
gcloud dns record-sets transaction add 35.36.111.225 --name=user6.pks4u.com --zone=pks4u-zone --ttl=5 --type=A
gcloud dns record-sets transaction execute --zone=pks4u-zone
```
Output:
```
Transaction started [transaction.yaml].
Record addition appended to transaction at [transaction.yaml].
Record addition appended to transaction at [transaction.yaml].
Record addition appended to transaction at [transaction.yaml].
Record addition appended to transaction at [transaction.yaml].
Executed transaction [transaction.yaml] for managed-zone [pks4u-zone].
Created [https://dns.googleapis.com/dns/v1/projects/fe-rmeira/managedZones/pks4u-zone/changes/169].
ID   START_TIME                STATUS
169  2020-03-18T21:44:10.046Z  pending
```

## Step 4 - 






