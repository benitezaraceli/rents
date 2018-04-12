CREATE TABLE client (
      dni                         integer PRIMARY KEY,
      fullname                    text NOT NULL,
      address                     text,
      phone                       text,
      mail                        text
);

CREATE RULE client_opaque_rule AS ON INSERT TO client
DO INSTEAD NOTHING;
