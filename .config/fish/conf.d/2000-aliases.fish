function awsid
    aws sts get-caller-identity
end

function flushdns
    sudo killall -HUP mDNSResponder
end

function awsunset
    set -e $(env | grep AWS_ | cut -d= -f1)
end

function awsprofile
    aws-okta-py save-creds -f -p $argv[1]
    set -x AWS_PROFILE $argv[1]
end

function assume_role 
    echo "Assuming role $argv[1]"
    set -l creds (aws sts assume-role --role-arn $argv[1] --role-session-name MySessionName --query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" --output text)
    set -gx AWS_ACCESS_KEY_ID (echo $creds | cut -d' ' -f1)
    set -gx AWS_SECRET_ACCESS_KEY (echo $creds | cut -d' ' -f2)
    set -gx AWS_SESSION_TOKEN (echo $creds | cut -d' ' -f3)
end

function killport
    # argv[1] port
    # argv[2] proto supported by /etc/protocols (Optional)

    if test -z $argv[2]
        set proto "tcp"
    else
        set proto $argv[2]
    end

    set pid (lsof -i $proto:$argv[1] -s $proto:LISTEN | tail -1 | awk '{print $2}')
    if test -z $pid
        echo "No process on port $argv[1]" >&2
    else
        echo "Killing process $pid on port $argv[1]"
        kill -9 $pid
    end
end

function kctx
    kubectx $argv
end

function kns
    kubens $argv
end

function k
    kubectl $argv
end
