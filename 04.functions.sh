#!/bin/bash

# our program goal is to install mysql

DATE=$(date +%F)
SCRIPT_NAME=$0
LOGFILE=/tmp/$SCRIPT_NAME-$DATE.log
echo "$DATE,$SCRIPT_NAME,$LOGFILE"
echo $0

R="\e[31m"
G="\e[32m"
N="\e[0m"
VALIDATE(){
    #$1 --> it will receive the argument1
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE "
        exit 1
    else
        echo -e "$2 ... $G SUCCESS "
    fi
}
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1
# else
#     echo "INFO:: You are root user"
fi
yum install postfix -y &>>$LOGFILE
VALIDATE $? "Installing postfix"
#after validate  arg1 arg2