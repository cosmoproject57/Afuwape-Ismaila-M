#!/bin/bash
echo Please enter your name 
read name
echo welcome $name

mypin=1988
echo Please enter your pin
read pin
if [ $pin == $mypin ]
then 
	echo 'The ping you entered is correct'
else
	echo "sorry" $name "You entered a wrong pin"


fi

