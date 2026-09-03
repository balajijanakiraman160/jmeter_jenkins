pipeline{
    agent any
    stages{
        stage('Run Jmeter Test'){
            steps{
                bat '''
                if exist "result.jtl" del /f /q "result.jtl"
                if exist "html-report" rmdir /s /q "html-report"
                "C:\\apache-jmeter-5.6.3\\apache-jmeter-5.6.3\\bin\\jmeter.bat" -n -t "blazedemo Performance Test.jmx" -l "result.jtl" -e -o "html-report"
                '''
            }
        }
        stage('Publish HTML Report'){
            steps{
               publishHTML([
                   reportDir: 'html-report',
                   reportFiles: 'index.html',
                   reportName: 'jmeter performace report',
                   keepAll: true,
                   alwaysLinkToLastBuild: true,
                   allowMissing: false
                   ])
            }
        }
        stage('Send Email'){
            steps{
                emailext(
                    subject: 'JMeter Test - Build #' + env.BUILD_NUMBER + '-' + currentBuild.currentResult,
                    body: """
                    JMeter Test - Build #${env.BUILD_NUMBER}
                    Build Status: ${currentBuild.currentResult}
                    Check console output at ${env.BUILD_URL} to view the results.
                    Build Status: ${currentBuild.currentResult}
                    JMeter HTML Report is available in Jenkins.
                    """,
                    to: 'balajij.kiaq@gmail.com'
                    )
            }
        }
            }
        }
