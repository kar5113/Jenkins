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
        changed{
            echo 'This will execute only if there is a change in the repository'
        }
        fixed{
            echo 'This will execute only if the pipeline was failing before and now is successful'
        }
        regression{
            echo 'This will execute only if the pipeline was successful before and now is failing'
        }
        unstable
        {
            echo 'This will execute only if the pipeline is unstable'
        }
        unsuccessful{
            echo 'This will execute if the pipeline is not successful'
        }
        cleanup{
            echo 'This will always execute at the end of the pipeline'
            cleanWs()
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