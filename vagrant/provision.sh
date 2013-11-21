#!/bin/sh

docker pull relaxdiego/graphite
docker pull relaxdiego/graphite_dummy_data

echo
echo 'Registering Graphite service'
cp /home/core/share/vagrant/graphite.service /media/state/units/graphite.service

echo 'Registering Graphite Dummy Data service'
cp /home/core/share/vagrant/dummy_data.service /media/state/units/dummy_data.service


echo 'Restarting services'
systemctl restart local-enable.service

echo 'Provisioning complete!'
