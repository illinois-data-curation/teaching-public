drop table if exists inspection_violations;
drop table if exists inspections;
drop table if exists violations;

create table inspections
(
   inspection_id INTEGER,
   dba_name VARCHAR,
   aka_name VARCHAR,
   license_num INTEGER,
   facility_type VARCHAR,
   risk VARCHAR,
   address VARCHAR,
   city VARCHAR,
   state VARCHAR,
   zip INTEGER,
   inspection_date DATE,
   inspection_type VARCHAR,
   results VARCHAR,
   violations VARCHAR,
   primary key (inspection_id)
);

create table violations (
   violation_id INTEGER,
   description VARCHAR,
   primary key (violation_id)
);

create table inspection_violations (
    inspection_id INTEGER REFERENCES inspections(inspection_id),
    violation_id INTEGER REFERENCES violations(violation_id),
    comment VARCHAR
);