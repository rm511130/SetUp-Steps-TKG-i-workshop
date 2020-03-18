# Set-Up Steps for Tanzu-Workshop-PKS

The [Tanzu Workshop PKS](https://github.com/rm511130/Tanzu-Workshop-PKS) needs quite a lot of set-up for it to work. These instructions should help you with all the necessary steps.

## Step 1 - Manage-PKS Repo

- Using your Mac, check if you have the `/work/manage-pks/gcp` directory derived from `https://github.com/rm511130/manage-pks` containing the following files:
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
cd /work; rm -rf /work/manage-pks; git clone https://github.com/rm511130/manage-pks; cd /work/manage-pks/gcp
```

## Step 2 - PKS Environment

- You need a target PKS environment. In my case I have PKS 1.6.1 on GCP using OpsMan 2.8.3 and I also have Harbor 1.10.1 installed.
- My OpsMan URL is: `https://pcf.pks4u.com`           with credentials: `admin / password`
- My PKS API is at: `api.pks.pks4u.com`               with credentials: `pks_admin / password`
- Harbor is at:     `https://harbor.pks.pks4u.com`    with credentials: `admin / password`

- To get into my GCP account I use:  `Mac $ gcloud auth login` and `Mac $ open https://console.cloud.google.com/`
- My Godaddy `pks4u.com` domain nameservice has been delegated to `GCP` for management.

## Step 3 - AWS VMs

- I also have Ubuntu VMs (t2.medium) running on AWS (N. Virginia) `https://console.aws.amazon.com/` for each student.

- These VMs are using my AMI: `ami-095d7d3a049233cf5`. They come with multiple CLIs: `pks, cf, helm, gcloud, wget, docker, git, jq, python3, ...`

- These VMs are accessible via the use of a [`pem`](https://github.com/rm511130/Tanzu-Workshop-PKS/blob/master/fuse.pem) or [`ppk`](https://github.com/rm511130/Tanzu-Workshop-PKS/blob/master/fuse.pem) key.

- Their Public IP addresses must match to the DNS entries on GCP:




