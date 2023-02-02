export PATH=$HOME/bin:$HOME/sbin:$HOME/go/bin:$HOME/google-cloud-sdk/bin:/opt/homebrew/sbin:/opt/homebrew/bin:$PATH:/usr/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/jamf/bin

export GNUPGHOME=~/gnupg-workspace
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export HELM_EXPERIMENTAL_OC=1
export REDISCLOUD_SECRET_KEY=S4k5ss6cmcxkofwvmfilzxnqoqkbuciiyauh8ius4fy0i2r2i9e\nexport REDISCLOUD_ACCESS_KEY=Ad8pallhdt4uu6d17e13bo8f8bjkm90yu8xim1glqv5i3hyozz\n
export TF_TOKEN_app_terraform_io=$(gcloud secrets versions access latest --secret terraform-cloud-token --project dojo-platform-2022)
export GITHUB_ACCESS_TOKEN=$(< ~/src/connect/github-access-token.txt)
export GOPRIVATE="github.com/dojo-engineering/*,github.com/Paymentsense/*,github.com/paymentsense/*"
