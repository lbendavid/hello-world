#!/bin/bash

test_file=nab.xml
test_cmd=read_nab.pl

# Ne test que le code retour
if ./$test_cmd $test_file >/dev/null 2>&1 ; then
   echo ok - Return code success
else
   echo nook
fi
