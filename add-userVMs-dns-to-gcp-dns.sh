gcloud dns record-sets transaction start --zone=pks4u-zone
gcloud dns record-sets transaction add 35.36.111.222 --name=user3.pks4u.com --zone=pks4u-zone --ttl=300 --type=A
gcloud dns record-sets transaction add 35.36.111.223 --name=user4.pks4u.com --zone=pks4u-zone --ttl=300 --type=A
gcloud dns record-sets transaction add 35.36.111.224 --name=user5.pks4u.com --zone=pks4u-zone --ttl=300 --type=A
gcloud dns record-sets transaction add 35.36.111.225 --name=user6.pks4u.com --zone=pks4u-zone --ttl=300 --type=A
gcloud dns record-sets transaction execute --zone=pks4u-zone
