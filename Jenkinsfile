pipeline {
   agent{ node {
        label 'linux'
        // customWorkspace '/some/other/path'
    }
}
    stages { 
        stage('Example') {
            steps {
                echo 'Hello World'
            }
        }

        stage('stage-2'){
            steps{
                echo 'This is stage 2'
            }
        }

        stage ('stage-deploy'){
            steps{
                echo 'This is stage deploy'
            }
        }
    }

    post{
        always{
            echo 'This will always execute'
            cleanWs()
        }
        success{
            echo 'This will execute only if the pipeline is successful'
        }
        failure{
            echo 'This will execute only if the pipeline fails'
        }
    }
}

// pipeline{
//     agent any
//     stages{
//         stage('hsdgfk'){
//             steps{
//                 echo 'This is new stage added'
//             }
//         }
//     }
// }