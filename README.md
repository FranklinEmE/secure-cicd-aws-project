🚀 Secure CI/CD AWS DevOps Project
📌 Project Overview

This project demonstrates a complete end-to-end CI/CD pipeline for a Flask application using modern DevOps tools.

It automates:

Code push from GitHub
Jenkins pipeline execution
Docker image build
Push to DockerHub
Deployment on AWS EC2
Optional Kubernetes deployment

This project simulates a real production DevOps workflow.

⚙️ Architecture Flow
GitHub → Jenkins → Docker Build → DockerHub → AWS EC2 → Running Container → Browser
🧰 Tech Stack
AWS EC2
Jenkins
Docker
DockerHub
Terraform
Kubernetes
GitHub
Flask (Python)
🌐 Live Application

👉 http://63.184.220.105:5000

🚀 CI/CD Pipeline Steps
Developer pushes code to GitHub
Jenkins automatically triggers pipeline
Docker image is built
Image is pushed to DockerHub
EC2 pulls and runs container
Application becomes live
📸 PROJECT SCREENSHOTS (WITH EXPLANATION)
🔹 1. GitHub Repository

Description:
This shows the source code stored in GitHub. It is the starting point of the CI/CD pipeline where all changes are pushed and tracked.

🔹 2. Jenkins Dashboard

Description:
This is the Jenkins dashboard showing the configured pipeline job and build history. Jenkins is responsible for automating the entire CI/CD process.

🔹 3. Jenkins Pipeline Execution

Description:
This shows a successful pipeline run where all stages (build, docker, push, deploy) executed successfully.

🔹 4. Docker Image Build

Description:
This shows Docker building the application image inside Jenkins using the Dockerfile.

🔹 5. DockerHub Repository

Description:
This shows the Docker image pushed successfully to DockerHub, which acts as the image registry.

🔹 6. Running Container on EC2

Description:
This shows the Docker container running on AWS EC2 exposing port 5000.

🔹 7. Live Application in Browser

Description:
This shows the Flask application running successfully in a browser after deployment.

🔹 8. Security Group Configuration

Description:
This shows AWS security group rules allowing inbound traffic on port 5000 for public access.

🔹 9. AWS VPC Infrastructure Map

Description:
This shows AWS networking setup including VPC, subnets, routing, and EC2 placement.

📂 Project Structure
secure-cicd-aws-project/
│
├── app.py
├── Dockerfile
├── Jenkinsfile
├── requirements.txt
│
├── terraform/
│   ├── main.tf
│   ├── eks.tf
│   ├── security.tf
│   ├── variables.tf
│
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
│
└── screenshots/
    ├── github-repository.png
    ├── jenkins-dashboard.png
    ├── jenkins-pipeline-job.png
    ├── docker-images.png
    ├── dockerhub-repository.png
    ├── running-container.png
    ├── application-running-on-browser.png
    ├── security-group-port.png
    ├── vpc-resources-map.png
🔐 Key Features
Fully automated CI/CD pipeline
Docker containerization
AWS EC2 deployment
Terraform infrastructure provisioning
Kubernetes deployment support
DockerHub integration
End-to-end DevOps workflow
📊 What I Learned
Jenkins pipeline automation
Docker image lifecycle
AWS EC2 deployment
Kubernetes basics
Terraform IaC
CI/CD best practices
🚀 Future Improvements
Kubernetes EKS cluster deployment
Monitoring with Prometheus & Grafana
HTTPS with Nginx
Multi-environment CI/CD (dev/staging/prod)
👨‍💻 Author

Franklin Chidera Emmanuel

GitHub: https://github.com/FranklinEmE
Project: Secure CI/CD AWS Pipeline

⭐ Final Note

This project demonstrates a real-world DevOps pipeline from code commit to production deployment using industry-standard tools.
