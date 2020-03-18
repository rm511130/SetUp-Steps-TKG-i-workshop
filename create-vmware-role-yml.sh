# Script to create Roles for PKS Lab/Workshop
# 03/17/2020

rm -f rbac.yml
touch rbac.yml

for i in {2..25}
do
  echo "---" >> rbac.yml
  echo "kind: Role" >> rbac.yml
  echo "apiVersion: rbac.authorization.k8s.io/v1beta1" >> rbac.yml
  echo "metadata:" >> rbac.yml
  echo "  namespace: namespace$i" >> rbac.yml
  echo "  name: vmware-role$i" >> rbac.yml
  echo "rules:" >> rbac.yml
  echo "- apiGroups: [\"*\"]" >> rbac.yml
  echo "  resources: [\"*\"]" >> rbac.yml
  echo "  verbs: [\"*\"]" >> rbac.yml
done

mv rbac.yml vmware-create-roles.yml

pks login -a https://api.pks.pks4u.com:9021 -u pks_admin -p password -k
pks get-credentials shared-cluster

kubectl apply -f vmware-create-roles.yml
