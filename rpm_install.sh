#!/bin/bash

# Check if user have sudo access

id=$UID
package_name=$1
if [ $id == 0 ]
then
        dnf list installed $package_name >/dev/null 2>&1
        if [ $? == 0 ]
        then
                echo "$package_name is already installed on server."
        else
           dnf install $package_name -y >/dev/null 2>&1
           if [ $? == 0 ]
           then
                echo "$package_name installed on server."
           else
                echo "failed to installed $package_name."
           fi
        fi
else
     echo "Please run script with sudo access"
fi
