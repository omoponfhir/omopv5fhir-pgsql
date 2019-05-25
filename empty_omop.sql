delete from care_site;
delete from visit_occurrence;
delete from drug_exposure;
delete from condition_occurrence;
delete from device_exposure;
delete from measurement;
delete from observation;
delete from note;
delete from procedure_occurrence;
delete from provider;
delete from f_person;
delete from person;
delete from location;

select setval('omop_v5.caresite_id_seq', ( select max(care_site_id) from care_site ));
select setval('omop_v5.condition_occurrence_id_seq', ( select max(condition_occurrence_id) from condition_occurrence ));
select setval('omop_v5.drug_exposure_id_seq', ( select max(drug_exposure_id) from drug_exposure ));
select setval('omop_v5.location_id_seq', ( select max(location_id) from location ));
select setval('omop_v5.measurement_occurrence_id_seq', ( select max(measurement_id) from measurement ));
select setval('omop_v5.observation_occurrence_id_seq', ( select max(observation_id) from observation ));
select setval('omop_v5.person_id_seq', ( select max(person_id) from person ));
select setval('omop_v5.procedure_occurrence_id_seq', ( select max(procedure_occurrence_id) from procedure_occurrence ));
select setval('omop_v5.provider_id_seq', ( select max(provider_id) from provider ));
select setval('omop_v5.visit_occurrence_id_seq', ( select max(visit_occurrence_id) from visit_occurrence ));
select setval('omop_v5.note_id_seq', ( select max(note_id) from note ));

commit;