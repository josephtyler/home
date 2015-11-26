#!/bin/bash


cd ~

if [ -d home ]; then
    echo "home exists"
else
    echo "home doesn't exist"
fi
