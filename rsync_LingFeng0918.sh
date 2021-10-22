#!/bin/sh
cd /scripts/
git clone https://github.com.cnpmjs.org/LingFeng0918/jd_scripts.git
cd jd_scripts
ls |grep -v "md"|xargs -I {} cp -rf {} ../
cp docker/crontab_list.sh /scripts/docker/crontab_list.sh
sed -i '/短期活动/a\0 */8 * * * sh /scripts/docker/rsync_LingFeng0918.sh' /scripts/docker/crontab_list.sh
sed -i '/短期活动/a\*/1 * * * * sh rm -rf jd_cleancart.js' /scripts/docker/crontab_list.sh
sed -i '/jd_cleancart/d' /scripts/docker/crontab_list.sh
cd ../
rm -rf jd_scripts
rm -rf jd_cleancart.js