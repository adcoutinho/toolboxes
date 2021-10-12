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

# Minikube

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
