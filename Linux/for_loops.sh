#!/bin/bash

#list of favorite states
stateslist=('California' 'Nevada' 'Arizona' 'Washington' 'Montana' 'Hawaii')
for state in ${stateslist[@]} 
do 
        if [ $state == 'Hawaii' ];      
        then 
                echo "Hawaii is the best!"
        else 
                echo "I'm not fond of Hawaii"
        fi
done

files=('/etc/passwd' '/etc/passwd')
echo -e "\nThe permissions for sensitive /etc files : \n" >> $output
for file in ${files[@]};
do
        ls -lah $file >> $output
done