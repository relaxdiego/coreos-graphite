#!/bin/sh

docker pull relaxdiego/graphite

echo
echo 'Registering Graphite service'
cp /home/core/share/vagrant/graphite.service /media/state/units/graphite.service


echo 'Restarting services'
systemctl restart local-enable.service

echo 'Provisioning complete!'
