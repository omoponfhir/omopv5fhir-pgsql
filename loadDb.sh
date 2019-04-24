#!/bin/bash
#untar the postgres dump
mkdir -p /opt/data
tar -xvzf /opt/data/omop_v5_dump.tgz -C /opt/data
rm -rf /opt/data/omop_v5_dump.tgz

#put data in postgres
psql -U postgres -d postgres -a -f /opt/data/create_user.sql
psql -U postgres < /opt/data/omop_v5_dump
psql -U postgres -d postgres -a -f /opt/data/update_seqs.sql
rm -rf /opt/data/*