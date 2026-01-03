pipeline {
    node {
        label 'linux'
        // customWorkspace '/some/other/path'
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