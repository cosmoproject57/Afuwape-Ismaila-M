#A switch case to take value from 1 to 5 by ismaila afuwape
#!/bin/bash
echo 'Enter value from 1 to 5' 
read number
case $number in 
  1) 
echo "user enter value $number sucessfully" ;;
  2)
echo "user enter value $number sucessfully" ;;
  3)
echo "user enter value $number sucessfully" ;;
  4)
echo "user enter value $number sucessfully" ;;
  5)
echo "user enter value $number sucessfully" ;;
  *) 
echo 'sorry you passed the wrong value option'
echo 'Value options are 1|2|3|4|5' ;;
esac
echo 'switch case ends'
