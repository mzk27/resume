pipeline {
    agent any

    environment {
        ANSIBLE_CONFIG = '/var/lib/jenkins/.ansible/ansible.cfg'
    }

    stages {
        stage('Install Dependencies') {
            steps {
                withEnv(["ANSIBLE_CONFIG=$ANSIBLE_CONFIG"]) {
                    ansiblePlaybook playbook: '/var/lib/jenkins/workspace/resume/ansible/install_dependencies.yml'
                }
            }
        }

        stage('Prepare Directories') {
            steps {
                withEnv(["ANSIBLE_CONFIG=$ANSIBLE_CONFIG"]) {
                    ansiblePlaybook playbook: '/var/lib/jenkins/workspace/resume/ansible/prepare_directories.yml'
                }
            }
        }

        stage('Copy Files') {
            steps {
                withEnv(["ANSIBLE_CONFIG=$ANSIBLE_CONFIG"]) {
                    ansiblePlaybook playbook: '/var/lib/jenkins/workspace/resume/ansible/copy_files.yml'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                withEnv(["ANSIBLE_CONFIG=$ANSIBLE_CONFIG"]) {
                    ansiblePlaybook playbook: '/var/lib/jenkins/workspace/resume/ansible/deploy_containers.yml'
                }
            }
        }

        stage('Verify Setup') {
            steps {
                sh 'curl -I http://resume.mzkhan.pro'
            }
        }
    }
}
