CREATE TABLE IF NOT EXISTS audit_logs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  actor UUID,
  action TEXT,
  target TEXT,
  ip INET,
  ts TIMESTAMPTZ DEFAULT now()
);
