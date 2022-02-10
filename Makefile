.PHONY: all common system packages users ssh firewall fail2ban nginx vim plausible

COMMON_BECOME_ASK_PASS="True"
COMMON_ASK_VAULT_PASS="False"

PLAUSIBLE_ASK_VAULT_PASS="False"

all: common plausible

common:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml common.yml

system:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "system" common.yml

packages:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "packages" common.yml

users:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "users" common.yml

ssh:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "ssh" common.yml

firewall:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "firewall" common.yml

fail2ban:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "fail2ban" common.yml

nginx:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "nginx" common.yml

vim:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "vim" common.yml

vim:
	ANSIBLE_BECOME_ASK_PASS=$(COMMON_BECOME_ASK_PASS) \
	ANSIBLE_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "cron" common.yml

plausible:
	ANSIBLE_ASK_VAULT_PASS=$(PLAUSIBLE_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml plausible.yml