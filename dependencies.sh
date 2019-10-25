#!/bin/sh
set -eux

sudo yum -y update
sudo yum -y install curl nano policycoreutils openssh-server openssh-clients postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo yum -y install gitlab-ce
sudo touch /etc/sysconfig/i18n

sudo tee -a /etc/sysconfig/i18n << EOF
LANG="ru_RU.UTF-8"
SUPPORTED="ru_RU.UTF-8:ru_RU:ru"
SYSFONT="latarcyrheb-sun16"
EOF

sudo localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8
sudo localectl set-locale LANG=ru_RU.utf8

sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

sudo gitlab-ctl reconfigure

echo "
******************************************
*** Mission Complete! Congratulations! ***
***   http://192.168.214.126 - GitLab  ***
******************************************
"
