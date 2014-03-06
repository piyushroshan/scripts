#!/bin/bash

if [ $# == 2 ] ; then

    sleep $1 
    nohup $2 &

else

    echo "Usage: $0 delay command"

fi
exit
fi
