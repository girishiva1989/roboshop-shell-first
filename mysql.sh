echo -e "\e[31m<<<<<<<<<Disable MySQL 8 version>>>>>>>>>\e[0m"
dnf module disable mysql -y

echo -e "\e[31m<<<<<<<<<Setup MySQL5.7 repo file>>>>>>>>>\e[0m"
cp /home/centos/roboshop-shell-first/mysql.repo /etc/yum.repos.d/mysql.repo

echo -e "\e[31m<<<<<<<<<Install MySQL Server>>>>>>>>>\e[0m"
dnf install mysql-community-server -y

echo -e "\e[31m<<<<<<<<<Start Service>>>>>>>>>\e[0m"
systemctl enable mysqld
systemctl start mysqld

echo -e "\e[31m<<<<<<<<<Change the default root password>>>>>>>>>\e[0m"
mysql_secure_installation --set-root-pass RoboShop@1

echo -e "\e[31m<<<<<<<<<Check the new password is working>>>>>>>>>\e[0m"
mysql -uroot -pRoboShop@1
quit