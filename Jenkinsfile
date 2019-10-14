node{
    def appName = 'deploy_test'
    def tag = "v_${env.BUILD_NUMBER}"
    def img = "${appName}_${env.BRANCH_NAME}"
    def imgWithTag = "ohya/${img}:${tag}"

    checkout scm

    stage ('建立映像檔') {
        echo "建立映像檔"
        sh "docker build -t ${imgWithTag} ."
    }

    stage ('放置映像檔') {
        echo "放置映像檔"
        sh "gcloud docker -- push ${imgWithTag} "
    }

    stage '部署'
    // replace as new image
    sh("sed -i.bak 's#ohya/deploy-test#${imgWithTag}#' ./k8s/deploy.yaml")
    switch (env.BRANCH_NAME) {
        case "master":
            // replace namespace settings
            sh("sed -i.bak 's#env: current#env: ${devNamespace}#' ./k8s/service.yaml")
            sh("sed -i.bak 's#env: current#env: ${devNamespace}#' ./k8s/deploy.yaml")
            sh("kubectl --namespace=${devNamespace} apply -f ./k8s/service.yaml")
            sh("kubectl --namespace=${devNamespace} apply -f ./k8s/deploy.yaml")
            break
    }
}
