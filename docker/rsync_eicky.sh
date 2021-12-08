#!/bin/sh
cd /scripts/
git clone https://github.com.cnpmjs.org/eicky/jd_scripts.git
cd jd_scripts
ls |egrep -v "md|Loon|docker|myCrontab|QuantumultX|Surge|clean_car"|xargs -I {} cp -rf {} ../
cp -rf docker/crontab_list.sh /scripts/docker/crontab_list.sh
sed -i '/jd_cleancart/d' /scripts/docker/crontab_list.sh
sed -i '/LingFeng0918/d' /scripts/docker/crontab_list.sh
sed -i '/#活动#/a\0 */4 * * * sh /scripts/docker/rsync_eicky.sh' /scripts/docker/crontab_list.sh
sed -i '4i 0 */4 * * * sh /scripts/docker/rsync_eicky.sh' /scripts/docker/crontab_list.sh
cd ../
ls|egrep "jd_cleancart|jddj|jd_read|joy|jd_clean"|xargs -I {} rm -rf {}
rm -rf jd_scripts