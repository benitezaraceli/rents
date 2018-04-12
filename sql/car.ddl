CREATE TABLE car (
      patent                      text PRIMARY KEY,
      brand                       text NOT NULL,
      model                       text NOT NULL,
      year                        integer NOT NULL,
      description                 text,
      status                      text NOT NULL
);

CREATE RULE car_opaque_rule AS ON INSERT TO car
DO INSTEAD NOTHING;
