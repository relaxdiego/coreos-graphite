#!/bin/sh

docker pull relaxdiego/graphite
docker pull relaxdiego/graphite_dummy_data


echo
echo 'Registering Graphite service'
printf "[Unit]
Description=Graphite Service
After=docker.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run -p 8080:8080 -p 2003:2003 -p 2004:2004 -p 7002:7002 relaxdiego/graphite /opt/graphite/start

[Install]
WantedBy=local.target
" > /media/state/units/graphite.service


printf "[Unit]
Description=Graphite Dummy Data Service
After=graphite.service

[Service]
Restart=always
ExecStart=/usr/bin/docker run -p 2009:2009 relaxdiego/graphite_dummy_data /opt/dummy_data/start

[Install]
WantedBy=local.target
" > /media/state/units/dummy_data.service


echo 'Restarting services'
systemctl restart local-enable.service

echo 'Provisioning complete!'
