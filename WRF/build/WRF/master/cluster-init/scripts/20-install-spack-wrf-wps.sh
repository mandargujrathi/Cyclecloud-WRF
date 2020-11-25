#!/bin/bash
set -ex

CURR_DIR=sysadm-aksalatenna

jetpack download "azurehpc.tar.gz" /mnt/exports/shared/home/$CURR_DIR --project WRF

tar -xf /mnt/exports/shared/home/$CURR_DIR/azurehpc.tar.gz -C /mnt/exports/shared/home/$CURR_DIR
sudo chmod 777 -R /mnt/exports/shared/home/$CURR_DIR/azurehpc
sudo chmod 777 -R /apps


#cd /mnt/exports/shared/home/$CURR_DIR/azurehpc/apps/spack
#sudo -u $CURR_DIR ./build_spack.sh hbv2 mandar.gujrathi@microsoft.com wrfalcoa

#cd
#echo "source /apps/spack/0.15.4/spack/share/spack/setup-env.sh" >>/mnt/exports/shared/home/.bashprofile
#sudo -u mandar source /apps/spack/0.15.4/spack/share/spack/setup-env.sh

#sudo -u mandar /mnt/exports/shared/home/$CURR_DIR/azurehpc/apps/wrf/build_wrf.sh openmpi hb

#sudo -u mandar /mnt/exports/shared/home/$CURR_DIR/azurehpc/apps/wrf/build_wps.sh openmpi hb
