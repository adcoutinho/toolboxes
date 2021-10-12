### Terraform ###

# Pre-reqs
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

# Hashicorp GPG Key and repo (Terraform, Vault, Packer etc)
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install Terraform
sudo apt-get update && sudo apt-get install terraform -y



### Kubectl ###

# Download latest version
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Install 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


# Printunl

# Add repo for Ubuntu Hirsute Hippo
sudo tee /etc/apt/sources.list.d/pritunl.list << EOF
deb https://repo.pritunl.com/stable/apt hirsute main
EOF

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
sudo apt-get update
sudo apt-get install pritunl-client-electron -y

# AWS Cli
sudo apt install awscli -y

# AWS Configure sandbox

printf "%s\n%s\nus-east-1\njson" "$KEY_ID" "$SECRET_KEY" | aws configure --profile airfox-sandbox
# aws configure set aws_access_key_id "$AWS_ACCESS_KEY_ID" --profile user2 && aws configure set --profile user2 && aws_secret_access_key "$AWS_ACCESS_KEY_SECRET" --profile user2 && aws configure set region "$AWS_REGION" --profile user2 && aws configure set output "text" --profile user2
# aws configure set aws_session_token "$AWS_SESSION_TOKEN" --profile airfox-sandbox

aws configure --profile sandbox
[996498533196_Airfox-AWS-Sandbox-Admin]
aws_access_key_id=ASIA6QA7Q5NGMLJHCGO7
aws_secret_access_key=d5viNpTovLWx8oXHG19Z4QqnvNL/GmdfS6fNo4e/
aws_session_token=IQoJb3JpZ2luX2VjEMf//////////wEaCXVzLWVhc3QtMSJHMEUCIFYyn3HF9Cwc5vw8Qd/hQ++9ayLMlBF4O4dppYwaOahjAiEAtW3bTFlYp+HtTzqSkTresRBfRP0PDWMKfbOnBZbeAGMqngMILxABGgw5OTY0OTg1MzMxOTYiDCT7U3RjrX98Dwk9ICr7Alf5fEyFjIv6XusxP6TJaSvXjQLAdTRWIBDQ88EflaSSh2V9U4wHjDfQBTO6WOdQ/xsvc4QwlcmIFsaegHs2TINvKHhx6RHD4QsSU+p1nmjbFqTvQWEBE+mK7di9kQ98uco4T3fLk4fFT7T3goECjbVQ2uZqNk0Z5m/cfp1M42LhJZvPlPPTEjrgqsfgwbnh0KSlBmuKJYUFhMhOCwVlsaYdSVaFExWvMx+bF2AqdihRazjjPorfrsHB2izLl5ZrZ/QWLu4N0O+7yXzRiAeZX+dKQhPpy3E2MRwx9sBHaSXhmK6yZi1AycTYzMm1uf/22hkZaYEZgEqAGMDwjkebzOIY1Akq9Pc+SdOzQNzY9YSbmdCEjITrjZI0ZmBe8vscOQQPh5Pbcd2gyXL/8Eta/YafqMettSm82casoCAfBcxQvbDYhTkWTdeWka4BxhjqXES27d1uL39U3TsFsppl66c9kPlZp23Xy6TnDWne0GJ9gm7W5nEj+izqoMAw9JOyigY6pgEDoPWkt/+YsEFd0OvyAaNTZ9Gyy9TB9qeTFSogNOHeLpNEodqzfneBtdbN80tGpiWWaxUHc+gFkgzVnqUsiudOro2GaYO5J4vPZ8ldpBBVmp6tmvRo/jDVsco0gsNJAy7zupYmS+wI/ARqQnD29X9uFQH92dAdXSAyg6GUiRK509wFyKA6N4v+zWm/FmQoCutA4CU+QlCHUPBkxRCiCZAXbDixV+cK


# Minikube

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
