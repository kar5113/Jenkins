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
        timeout(time: 5, unit: 'MINUTES')  // Timeout for entire Pipeline run
        disableConcurrentBuilds()      // Disable concurrent builds
    }
    // triggers {
    //         cron('H 2 * * 1-5') // Trigger the pipeline every weekday at 2 AM
    //         pollSCM('H/5 * * * *') // Poll the SCM for changes every 5 minutes
    //     }
    parameters {
        string(name: 'my_param', defaultValue: 'default value', description: 'This is my parameter')
        booleanParam(name: 'my_bool_param', defaultValue: true, description: 'This is my boolean parameter')
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'DEPLOY', defaultValue: false, description: 'Choose whether to deploy')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }
    stages { 
        stage('Example') {
            steps {
                echo 'Hello World'
                echo "${my_env_var}"
                //  input message: 'Do you want to proceed to deployment?', ok: 'Yes, deploy'
            }
        }

        stage('stage-2'){
            steps{
                script{
                    sh """
                    echo "this is stage 2 and executing shell script"
                    echo "${my_env_var}"
                    #sleep 5
                    echo "Parameter value is ${params.my_param}"
                    echo "Boolean Parameter value is ${params.my_bool_param}"
                    """
                }
            }
        }

        stage ('stage-deploy'){
            //  input {
            //     message "Should we continue?"
            //     ok "Yes, we should."
            //     submitter "alice,bob"
            //     parameters {
            //         string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
            //     }
            // }
            when {
               expression { ${params.DEPLOY} == true  }
            }
            steps{
                echo 'This is stage deploy'
                   echo "Hello ${params.PERSON}"

                echo "Biography: ${params.BIOGRAPHY}"

                echo "Toggle: ${params.TOGGLE}"

                echo "Choice: ${params.CHOICE}"

                echo "Password: ${params.PASSWORD}"
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