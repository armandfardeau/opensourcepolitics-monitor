-- +micrate Up
CREATE TABLE instances (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  url VARCHAR,
  repo VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);


-- +micrate Down
DROP TABLE IF EXISTS instances;
