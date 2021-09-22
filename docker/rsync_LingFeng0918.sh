#!/bin/sh
git clone https://github.com.cnpmjs.org/LingFeng0918/jd_scripts.git
cd jd_scripts
ls |grep -v "md"|xargs -I {} cp -rf {} ../
cp docker/crontab_list.sh /scripts/docker/crontab_list.sh
sed -i '/短期活动/a\15 0 * * * git clone https://github.com.cnpmjs.org/Sirius2016/jd_scripts-fork.git  /scripts' /scripts/docker/crontab_list.sh
cd ../
rm -rf jd_scripts