#Use an Debian Image to build the tgz file for the data dump
FROM debian:jessie as dumpbuilder
COPY sample_data /usr/local/share/sample_data
#create the dump file
RUN cat /usr/local/share/sample_data/datadump* > /usr/local/share/sample_data/omop_v5_dump.tgz

# Use the Postgres image as a base
FROM postgres:alpine

# Define environment variable
#ENV POSTGRES_USER omop_v5
ENV POSTGRES_PASSWORD i3lworks
#ENV POSTGRES_DB omop_v5

# Copy omop_v5_dump.tgz to the /opt/data/ folder
COPY --from=dumpbuilder /usr/local/share/sample_data/omop_v5_dump.tgz /opt/data/omop_v5_dump.tgz
ADD *.sql /opt/data/
RUN chmod -R -v a+rwx /opt/data

# Add a loadDb.sh to docker-entrypoint-initdb.d so it is run at the end of the start up process to configure the database
COPY loadDb.sh /docker-entrypoint-initdb.d/loadDb.sh
RUN chmod -v a+rwx /docker-entrypoint-initdb.d/loadDb.sh

EXPOSE 5432
