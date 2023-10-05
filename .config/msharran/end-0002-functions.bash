### FUNCTIONS

sshaddkeys() {
  ssh-add ~/.ssh/id_rsa
  ssh-add ~/.ssh/id_rsa_happay
  cd ~/.ssh/ssh-keys
  ssh-add -v --apple-use-keychain $(ls | grep -v .pub)
}

whichaws() {
  cat ~/.aws/config | grep -B1 $1
}

path() {
  echo $PATH | tr ":" "\n"
}

awsunset() {
  unset $(env |grep AWS_|cut -d= -f1)
}

awsprofile() {
  aws-okta-py save-creds -f -p $1
  export AWS_PROFILE=$1
}

awsweb() {
  aws-okta-py login $@
}

assume_role() {
    echo "Assuming role $1"
    export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
        $(aws sts assume-role \
            --role-arn $1 \
            --role-session-name MySessionName \
            --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
    --output text))
}

killport() {
    echo "killing port with command...\nfuser -k $1/tcp"
    fuser -k $1/tcp
}
