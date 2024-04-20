### FUNCTIONS

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
    # $1 port
    # $2 proto supported by /etc/protocols (Optional)
    
    if [ -z "$2" ]; then
        proto="tcp"
    else
        proto="$2"
    fi

    pid="$(lsof -i $proto:$1 -s $proto:LISTEN | tail -1 | awk '{print $2}')"
    if [ -z "$pid" ]; then
        echo "No process on port $1" >&2
    else
        echo "Killing process $pid on port $1"
        kill $pid
    fi
}

java_ls() {
    /usr/libexec/java_home -V
}
