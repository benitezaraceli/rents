CREATE TABLE car (
      patent                      text PRIMARY KEY,
      brand                       text NOT NULL,
      model                       text NOT NULL,
      year                        integer NOT NULL,
      description                 text,
      status                      text NOT NULL
);

CREATE OR REPLACE RULE car_prevent_change AS
	ON UPDATE TO 
		car
	WHERE 
		OLD.patent != NEW.patent
		OR OLD.creation_timestamp != NEW.creation_timestamp
	DO INSTEAD NOTHING;
