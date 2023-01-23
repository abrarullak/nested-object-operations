#!/bin/bash

#object=`echo "object = {"a":{"b":{"c":"d"}}}"`
object=`echo "object = {"x":{"y":{"z":"a"}}}"`
#echo $object

nested_key=`echo $object | sed 's/.*{\(.*\)}.*/\1/g' | sed 's/}//g' | sed "s/:/ /g" | awk '{print $1}' | sed "s/\\(.*\\)/[\1]/g" `
#echo $nested_key

nested_value=`echo $object | sed 's/.*{\(.*\)}.*/\1/g' | sed 's/}//g' | sed "s/:/ /g" | awk '{print $2}'`
#echo $nested_value

myarray=`echo "$nested_key=$nested_value"`
#echo $myarray

declare -A newArray$myarray
echo "${newArray[@]}"
