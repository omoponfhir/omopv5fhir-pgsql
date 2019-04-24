# PostgreSQL database for GT-FHIR. This container has a schema called "omop_v5", which contains a few
sample patient data. To support OMOPonFHIR, f_* table/view exist. To support context holder, some smart_* tables exists.
omop_v5 schema has OHDSI's OMOP v5 schema. 

Before run docker, preapre the sample data in OMOPv5. Do follows,

`$ cd sample_data`

`$ cat datadump* > ../omop_v5_dump.tgz`

This will combind the splitted data into the gzipped tar ball file. 


`$ sudo docker build -t smart-postgres .`

Run this image

`$ sudo docker run --name smart-postgres --net smart-net --ip 172.27.0.6 -p 5433:5432 --hostname smart-postgres -d smart-postgres:latest`
