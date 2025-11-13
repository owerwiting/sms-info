CREATE TABLE IF NOT EXISTS messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  campaign_id UUID REFERENCES campaigns(id) ON DELETE CASCADE,
  subaccount_id UUID REFERENCES subaccounts(id),
  phone TEXT NOT NULL,
  nls TEXT NOT NULL,
  debt NUMERIC(12,2) NOT NULL,
  text TEXT NOT NULL,
  provider_msg_id TEXT,
  status TEXT,
  status_at TIMESTAMPTZ,
  retries INT DEFAULT 0,
  created_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX IF NOT EXISTS idx_messages_status_at ON messages(status_at);
CREATE INDEX IF NOT EXISTS idx_messages_campaign ON messages(campaign_id);
