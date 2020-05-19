# full listing at:
# https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases

alias k='kubectl'
alias ka='kubectl apply --recursive -f'
alias kex='kubectl exec -i -t'

alias kd='kubectl describe'
alias kdc='kubectl describe configmap'
alias kdd='kubectl describe deployments'
alias kdi='kubectl describe ingress'
alias kds='kubectl describe services'
alias kdp='kubectl describe pods'
alias kds='kubectl describe secrets'

alias kdcn='kubectl describe configmap --namespace'
alias kddn='kubectl describe deployments --namespace'
alias kdin='kubectl describe ingress --namespace'
alias kdsn='kubectl describe services --namespace'
alias kdpn='kubectl describe pods --namespace'
alias kdsn='kubectl describe secrets --namespace'

alias krm='kubectl delete'
alias krmc='kubectl delete configmap'
alias krmd='kubectl delete deployments'
alias krmi='kubectl delete ingress'
alias krms='kubectl delete services'
alias krmp='kubectl delete pods'
alias krms='kubectl delete secrets'

alias kg='kubectl get'
alias kgc='kubectl get configmap'
alias kgd='kubectl get deployments'
alias kgi='kubectl get ingress'
alias kgs='kubectl get services'
alias kgp='kubectl get pods'
alias kgs='kubectl get secrets'

alias kgcn='kubectl get configmap --namespace'
alias kgdn='kubectl get deployments --namespace'
alias kgin='kubectl get ingress --namespace'
alias kgsn='kubectl get services --namespace'
alias kgpn='kubectl get pods --namespace'
alias kgsn='kubectl get secrets --namespace'

alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias klop='kubectl logs -f -p'
alias klc='kubectl logs configmap'
alias kld='kubectl logs deployments'
alias kli='kubectl logs ingress'
alias kls='kubectl logs services'
alias klp='kubectl logs pods'
alias kls='kubectl logs secrets'

alias ksys='kubectl --namespace=kube-system'
alias ksysa='kubectl --namespace=kube-system apply --recursive -f'
alias ksysg='kubectl --namespace=kube-system get'
alias ksyslo='kubectl --namespace=kube-system logs -f'
alias ksyslop='kubectl --namespace=kube-system logs -f -p'
alias ksysd='kubectl --namespace=kube-system describe'

alias sai='sudo apt install -y'
# -z : Uncompress the resulting archive with gzip command.
# -x : Extract to disk from the archive.
# -v : Produce verbose output i.e. show progress and file names while extracting files.
# -f backup.tgz : Read the archive from the specified file called backup.tgz.
# -C /tmp/data : Unpack/extract files in /tmp/data instead of the default current directory.
alias untar='tar zxvf'

alias clip='xclip -selection clipboard'
alias toclip='xclip -selection clipboard'

alias ifconfig='ip -color -brief link'
# sudo lshw -C network

alias apti='sudo apt install -y'

# zip with max compression: z <target.zip> <source>
alias z='zip -o -r -9'
# zip folder and put the same name to zip file
zf() {
    local folder="$1"
    folder="$(echo "$folder" | sed 's:/*$::')"
    zip -o -r -9 "$folder.zip" "$folder"
}

klx() {
    #partialMatch="${1:?Required pod or item name}"
    #echo "partialMatch: $partialMatch"
    #podName=$(kgp | grep -e "$partialMatch[^ ]\+" --only-matching)
    podName=$(kgp | grep "^data\-clean[^ ]\+" --only-matching)
    echo "kl $podName -c $podName"
    kl $podName -c $podName
}

krmx() {
    podName=$(kgp | grep "^data\-clean[^ ]\+" --only-matching)
    echo "krmp $podName"
    krmp $podName
}

alias docker-ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

alias docker-run-rabbit="docker run --detach --rm --hostname rabbit -p 5672:5672 -p 15672:15672 --name rbt rabbitmq:3-management"
alias docker-run-postgres="docker run --detach --hostname postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name postgres postgres:11.6"
# ngrok tcp 5432

alias gradle-latest='gradle wrapper --gradle-version 6.0.1'

alias docker-run-dynamodb="docker run -p 8000:8000 amazon/dynamodb-local"

alias docker-run-gs-dataflow="docker run -it --rm --name gs-dataflow docker.domain.net/spring-cloud-dataflow:latest"

alias docker-run-gs-dataflow-ci="docker run -it --rm --name gs-dataflow-ci -e DATAFLOW_URI=https://dataflow.product.ci.aws.domain.com docker.domain.net/spring-cloud-dataflow:latest"

alias docker-run-gs-dataflow-prod="docker run -it --rm --name gs-dataflow-prod -e DATAFLOW_URI=https://dataflow.product.prod.aws.domain.com docker.domain.net/spring-cloud-dataflow:latest"

alias docker-run-dataflow="docker run --rm --hostname dataflow -p 9393:9393 -v $HOME/source/Betstream/content-graph/jobs/data-cleanup-task/build:/build --name dataflow springcloud/spring-cloud-dataflow-server"
alias docker-exec-dataflow-bash="docker exec -it dataflow java bash"
alias docker-exec-dataflow="docker exec -it dataflow java -jar /shell.jar"


alias docker-run-dshell-ci="docker run -it --rm --name dshell-ci -e DATAFLOW_URI=https://dataflow.product.ci.aws.domain.com -v $HOME/source/Betstream/content-graph/jobs/data-cleanup-task/build:/build pivotaledu/scdf-shell"

alias docker-run-dshell-prod="docker run -it --rm --name dshell-prod -e DATAFLOW_URI=https://dataflow.product.prod.aws.domain.com pivotaledu/scdf-shell"

alias myip="ip addr show"

git-commit-and-push() {( set -e -u # running on a subshell, exit on error
    message="$1"
    
    git add .
    git commit -m "$1"
    git push
)}
alias gcp='git-commit-and-push'
alias gcp2='git-commit-and-push "Uploading progress"'


alias jmx='visualvm -cp:a /home/pablo/tools/opendmk_jmxremote_optional_jar-1.0-b01-ea.jar'

jmxData() {
    nodeIpPort=$(curl --silent https://smartstream-data.ci.aws.domain.com/betstream/env | jq '.systemProperties."public.address" + ":" + .systemEnvironment.JMX_PORT' --raw-output)
    echo "Opening $nodeIpPort..."
    jmx --openjxm $nodeIpPort
}

jmxView() {
    viewNodeIpPort=$(curl --silent https://smartstream-view.ci.aws.domain.com/betstream-view/env | jq '.systemProperties."public.address" + ":" + .systemEnvironment.PORT_TCP_8303' --raw-output)
    fullAddress="service:jmx:jmxmp://$viewNodeIpPort"
    echo "Opening $fullAddress..."
    jmx --openjmx $fullAddress
}
alias jmx-data='jmxData'
alias jmx-view='jmxView'

alias loadp='source ~/.bash_aliases'
alias profile='code ~/.bash_aliases'

alias clip='xclip -selection clipboard'
# ubuntu 20
#alias clip='xclip -rmlastnl -selection clipboard'

# CD
alias cd-source='cd ~/source'
alias cd-gh='cd ~/source/fomenta'
alias cd-gh-linux='cd ~/source/fomenta/linux'
alias cd-gh-samples='cd ~/source/fomenta/codesamples'


# tools
alias mw='$HOME/source/fomenta/linux/drivers/mousewheel.sh'
