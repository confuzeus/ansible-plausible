.PHONY: all common system packages users ssh firewall fail2ban nginx vim cron plausible

export ANSIBLE_BECOME_ASK_PASS=True
export ANSIBLE_ASK_VAULT_PASS=False

PLAUSIBLE_ASK_VAULT_PASS=False

all: common plausible

common:
	ansible-playbook -i inventory.yml common.yml

system:
	ansible-playbook -i inventory.yml --tags "system" common.yml

packages:
	ansible-playbook -i inventory.yml --tags "packages" common.yml

users:
	ansible-playbook -i inventory.yml --tags "users" common.yml

ssh:
	ansible-playbook -i inventory.yml --tags "ssh" common.yml

firewall:
	ansible-playbook -i inventory.yml --tags "firewall" common.yml

fail2ban:
	ansible-playbook -i inventory.yml --tags "fail2ban" common.yml

nginx:
	ansible-playbook -i inventory.yml --tags "nginx" common.yml

vim:
	ansible-playbook -i inventory.yml --tags "vim" common.yml

cron:
	ansible-playbook -i inventory.yml --tags "cron" common.yml

export ANSIBLE_BECOME_ASK_PASS=False
export ANSIBLE_ASK_VAULT_PASS=$(PLAUSIBLE_ASK_VAULT_PASS)

plausible:
	ansible-playbook -i inventory.yml plausible.yml
