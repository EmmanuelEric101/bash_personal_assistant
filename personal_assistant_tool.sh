#!/bin/bash

log_file="log.txt"
touch $log_file
echo "Welcome to this script"
read -p "Enter your name: " name
greet_me() {
read -p "How are you doing $name: " response
echo "I hope you entered a positive response if not, am sorry"
echo "Glad you are $response"
}
add_number() {
read -p "Enter the first number you want to add: " first_number
read -p "Enter the second number you want to add: " second_number
result=$(($first_number + $second_number))
echo "The result is: $result"
echo "$(date) - $name did addition of $first_number and $second_number which was $result" >> $log_file
}
multiply_number() {
read -p "Enter the first number you want to multiply: " first_num
read -p "Enter the second number you want to multiply: " second_num
answer=$(($first_num * $second_num))
echo "The answer is: $answer"
echo "$(date) - $name did multiplication of $first_num and $second_num which was $answer" >> $log_file
}
while true; do
echo
echo "1. Greet me"
echo "2. Add numbers"
echo "3. Multiply numbers"
echo "4. Show past logs"
echo "5. Clear log file"
echo "6. Exit"
echo
read -p "Enter an option: " choice

case $choice in
1)
greet_me
;;
2)
add_number
;;
3)
multiply_number
;;
4)
echo "==========Active logs=========="
echo
cat $log_file
echo
echo "==============================="
;;
5)
read -p "Are you sure you want to clear the log? (y/n) " reply
if [[ "${reply,,}" =~ ^(y|yes)$ ]]; then
> $log_file
sleep 1
echo "======================================="
echo "log file has been cleared successfully"
else
echo "======================================="
echo "Canceled"
sleep 2
fi
;;
6)
echo "Exiting..."
sleep 2
clear
exit 0
;;
*)
echo "Please enter a valid option"
;;
esac
done
sleep 4
clear
