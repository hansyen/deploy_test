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
}
