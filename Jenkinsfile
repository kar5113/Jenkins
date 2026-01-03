pipeline {
   agent{ node {
        label 'linux'
        // customWorkspace '/some/other/path'
    }
}
    environment{
        my_env_var = "This is my env variable"
    }
    options {
        timeout(time: 5, unit: 'SECONDS')  # Timeout for entire Pipeline run
        disableConcurrentBuilds()      # Disable concurrent builds
    }
    stages { 
        stage('Example') {
            steps {
                echo 'Hello World'
                echo "${my_env_var}"
            }
        }

        stage('stage-2'){
            steps{
                script{
                    sh """
                    echo "this is stage 2 and executing shell script"
                    echo "${my_env_var}"
                    #sleep 5
                    """
                }
            }
        }

        stage ('stage-deploy'){
            steps{
                echo 'This is stage deploy'
                script{
                    sh"""
                    env
                    """
                }
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