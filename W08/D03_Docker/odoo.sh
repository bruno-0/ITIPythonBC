#! /bin/bash

# Odoo not supported on Apple silicon yet.
# specifying platform as amd64 to run it through Rosetta 2 so it can be operatable on ARM based OS (Apple silicon).

sudo docker pull odoo --platform linux/amd64


sudo docker pull postgres:10

sudo docker run -d -e POSTGRES_USER=odoo -e POSTGRES_PASSWORD=odoo -e POSTGRES_DB=postgres --name db postgres:10

sudo docker run -td -p 8069:8069 --name myodoo --link db:db -t --mount type=volume,source=myodofs,target=/var/lib/odoo/custom_add_on odoo



## Check which OS is running & show results accordingly

if [[ "$OSTYPE" == "linux-gnu"* ]];
then
        xdg-open http://localhost:8069/

elif [[ "$OSTYPE" == "darwin"* ]];
then
        open http://localhost:8069/
fi



exit 0
