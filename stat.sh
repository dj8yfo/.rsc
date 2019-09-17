#!/bin/bash
# set -v
date '+%F %T.%N'
who
uptime
printf 'days left till new year: %s\n' $[365 - $(date +%j)]
{
    date '+%F %T.%N'
    who
    uptime
    printf 'days left till new year: %s' $[365 - $(date +%j)]
} > /home/sysmanj/session.log
