#! /bin/bash
rm -dr /home/merico/Lets_Encrypt/config/www/*
hugo && cp -r public/* /home/merico/Lets_Encrypt/config/www/
