CREATE TABLE IF NOT EXISTS subaccounts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  sender_id TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);
