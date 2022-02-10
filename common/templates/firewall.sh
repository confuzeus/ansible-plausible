#!/bin/sh

/sbin/ufw --force reset
/sbin/ufw default deny incoming
/sbin/ufw default allow outgoing

/sbin/ufw allow {{ sshd_port_number }}
/sbin/ufw allow 80
/sbin/ufw allow 443
/sbin/ufw --force enable