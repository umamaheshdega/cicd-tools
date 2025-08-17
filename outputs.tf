output "jenkins_public_ip" {
  value = module.jenkins.public_ip
}

output "jenkins_agent_private_ip" {
  value = module.jenkins_agent.private_ip
}
