# kubernetes

function k
    kubectl $argv
end

function kns
    kubens $argv
end

function kctx
    kubectx $argv
end

# aws

function awsid
    aws sts get-caller-identity
end

# general

function lr
    ls -lrt
end

function play
    cd ~/sharran/play $argv
end

function work
    cd ~/sharran/work $argv
end
