CREATE TABLE IF NOT EXISTS reports (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  period_daterange DATERANGE,
  type TEXT,
  path TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);
