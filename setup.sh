#!/bin/bash
$HOME = "/vagrant/"


CMD_ROUTE= `ls ${HOME}/shared/cmds/*.sh`
for CMD in ${CMD_ROUTE}; do
    BASE=`basename ${CMD}`
    CNAME=`echo ${BASE} | cut -d. -f1`
    echo "alias ${CNAME}=\" sh ${CMD}\"" >> ~/.bash_profile &
done
wait

echo 'alias cmds="cat ${HOME}/shared/cmds/index"' >> ~/.bash_profile
