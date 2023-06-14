output "jenkins_ssh" {
  value = "ssh -i '${random_id.name.hex}.pem' ubuntu@${module.jenkins.ip}"
}

output "jenkins_browser" {
  value = "${module.jenkins.ip}:8080"
}