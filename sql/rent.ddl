CREATE TABLE rent (
      id                          serial,
      patent                      text NOT NULL REFERENCES cars(patent),
      rent_date                   timestamp with time zone DEFAULT now(),
      return_date                 timestamp with time zone,
      dni                         integer NOT NULL REFERENCES clients(dni)
);

CREATE RULE rent_opaque_rule AS ON INSERT TO rent
DO INSTEAD NOTHING;
