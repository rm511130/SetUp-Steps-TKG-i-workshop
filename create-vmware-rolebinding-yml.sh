# Script to create Roles for PKS Lab/Workshop
# 03/17/2020

rm -f rbac.yml
touch rbac.yml

for i in {2..25}
do
  echo "---" >> rbac.yml
  echo "kind: RoleBinding" >> rbac.yml
  echo "apiVersion: rbac.authorization.k8s.io/v1beta1" >> rbac.yml
  echo "metadata:" >> rbac.yml
  echo "  name: vmware-role$i" >> rbac.yml
  echo "  namespace: namespace$i" >> rbac.yml
  echo "subjects:" >> rbac.yml
  echo "- kind: User" >> rbac.yml
  echo "  name: oidc:user$i" >> rbac.yml
  echo "  apiGroup: rbac.authorization.k8s.io" >> rbac.yml
  echo "roleRef:" >> rbac.yml
  echo "  kind: Role" >> rbac.yml
  echo "  name: vmware-role$i" >> rbac.yml
  echo "  apiGroup: rbac.authorization.k8s.io" >> rbac.yml
done

mv rbac.yml vmware-create-rolebindings.yml

pks login -a https://api.pks.pks4u.com:9021 -u pks_admin -p password -k
pks get-credentials shared-cluster

kubectl apply -f vmware-create-rolebindings.yml
