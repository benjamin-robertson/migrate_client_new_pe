#!/bin/sh

# Puppet Task Name: migrate_client_new_pe
#
# This is where you put the shell code for your task.
#
# You can write Puppet tasks in any language you want and it's easy to
# adapt an existing Python, PowerShell, Ruby, etc. script. Learn more at:
# https://puppet.com/docs/bolt/0.x/writing_tasks.html
#
# Puppet tasks make it easy for you to enable others to use your script. Tasks
# describe what it does, explains parameters and which are required or optional,
# as well as validates parameter type. For examples, if parameter "instances"
# must be an integer and the optional "datacenter" parameter must be one of
# portland, sydney, belfast or singapore then the .json file
# would include:
#  "parameters": {
#    "new_pe_server": {
#      "description": "New PE server to connect the agent to",
#      "type": "String[1]"
#    }
# Learn more at: https://puppet.com/docs/bolt/0.x/writing_tasks.html#ariaid-title11
#


# set all my varibles
pe_server=$PT__new_pe_server

echo $pe_server > /tmp/pe_server
env > /tmp/pe_server_env

yum -y erase puppet-agent
rm -rf /etc/puppetlabs/
rm -rf /opt/puppetlabs/
curl -k https://$pe_server:8140/packages/current/install.bash > /tmp/installpe.bash 
chmod 755 /tmp/installpe.bash
/tmp/installpe.bash 