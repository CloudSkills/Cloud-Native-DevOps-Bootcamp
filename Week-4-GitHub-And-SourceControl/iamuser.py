import boto3
import os

def new_iam_user():
    # Create connection to AWS API
    iam_user = boto3.client('iam')

    try:
        # Try to create a new user
        new_user_create = iam_user.create_user(
            UserName='cloudskills'
        )
        print(new_user_create)

    except:
        print(
            'No new user was created, please confirm your region, accesskey, and secretkey were correct and try again')
        exit()

    try:
        # For the user that you just created, this will give them programmatic access for AWS CLI
        new_user_access = iam_user.create_access_key(
            UserName='cloudskills'
        )

        print(new_user_access)

    except:
        print(
            'Users access key was not created. Please confirm you have permissions to utilize programmatic access in AWS and try again')


if __name__ == '__main__':
    new_iam_user()