.PHONY: all common system packages users ssh firewall fail2ban nginx vim plausible

COMMON_DEFAULT_BECOME_ASK_PASS="True"
COMMON_DEFAULT_ASK_VAULT_PASS="False"

PLAUSIBLE_DEFAULT_ASK_VAULT_PASS="False"

all: common plausible

common:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml playbook.yml

system:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "system" playbook.yml

packages:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "packages" playbook.yml

users:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "users" playbook.yml

ssh:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "ssh" playbook.yml

firewall:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "firewall" playbook.yml

fail2ban:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "fail2ban" playbook.yml

nginx:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "nginx" playbook.yml

vim:
	DEFAULT_BECOME_ASK_PASS=$(COMMON_DEFAULT_BECOME_ASK_PASS) \
	DEFAULT_ASK_VAULT_PASS=$(COMMON_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml --tags "vim" playbook.yml

plausible:
	DEFAULT_ASK_VAULT_PASS=$(PLAUSIBLE_DEFAULT_ASK_VAULT_PASS) \
	ansible-playbook -i inventory.yml plausible.yml