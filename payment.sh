echo -e "\e[31m<<<<<<<<<nstall Python 3.6>>>>>>>>>\e[0m"
dnf install python36 gcc python3-devel -y

echo -e "\e[31m<<<<<<<<<Add application User>>>>>>>>>\e[0m"
useradd roboshop

echo -e "\e[31m<<<<<<<<<Setup app directory>>>>>>>>>\e[0m"
rm -rf /app
mkdir /app

echo -e "\e[31m<<<<<<<<<Download the application code>>>>>>>>>\e[0m"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment.zip
cd /app
unzip /tmp/payment.zip

echo -e "\e[31m<<<<<<<<<Download the dependencies>>>>>>>>>\e[0m"
pip3.6 install -r requirements.txt

echo -e "\e[31m<<<<<<<<<Configure YUM Repos>>>>>>>>>\e[0m"
cp /home/centos/roboshop-shell-first/payment.service /etc/systemd/system/payment.service

echo -e "\e[31m<<<<<<<<<Load and Start the service>>>>>>>>\e[0m"
systemctl daemon-reload
systemctl enable payment
systemctl start payment