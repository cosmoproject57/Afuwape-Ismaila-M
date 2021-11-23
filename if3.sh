#!/bin/bash
echo Please enter a number
read num1
echo Please enter another number
read num2
if [ $num1 == $num2 ]
then
echo $num1 is equals to $num2
fi

# comparing prices
echo Please enter the price of mangoes
read price1
echo Please enter the price of oranges
read price2
if [ $price1 == $price2 ]
then
echo mangoes sells for $price1 
echo oranges sells for $price2
echo mangoes and oranges sells for the same price.
else
echo mangoes sells for $price1 
echo oranges sells for $price2
echo mangoes and oranges sells for different prices.
fi

