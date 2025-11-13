CREATE TABLE IF NOT EXISTS inbound (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  phone TEXT NOT NULL,
  text TEXT NOT NULL,
  received_at TIMESTAMPTZ NOT NULL,
  matched_rule TEXT
);
