CREATE TABLE IF NOT EXISTS recipients (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  import_id UUID REFERENCES imports(id) ON DELETE CASCADE,
  nls TEXT NOT NULL,
  phone TEXT NOT NULL,
  debt NUMERIC(12,2) NOT NULL,
  validated BOOLEAN DEFAULT FALSE
);
