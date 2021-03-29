# Create an IAM user
aws iam create-user --user-name Mike

# Create an IAM group
aws iam create-group --group-name Mikes-Group 

# Add user to group
aws iam add-user-to-group --user-name Mike --group-name Mikes-Group