#!/bin/bash
read -p "Enter table number: " number

for i in {1..10};do
        res=$(($number*$i))
        echo "$number X $i = $res"
done
