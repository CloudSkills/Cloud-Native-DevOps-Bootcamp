# Create an RBAC
az ad sp create-for-rbac -n "AzureDevOps" --role Contributor --scopes /subscriptions/220284d2-6a19-4781-87f8-5c564ec4fec9

# Create an RBAC for SDK/programmatic access
az ad sp create-for-rbac -n "AzureDevOps" --role Contributor --scopes /subscriptions/220284d2-6a19-4781-87f8-5c564ec4fec9 --sdk-auth