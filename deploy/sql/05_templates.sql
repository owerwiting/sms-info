CREATE TABLE IF NOT EXISTS templates (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  subaccount_id UUID REFERENCES subaccounts(id),
  name TEXT NOT NULL,
  body TEXT NOT NULL,
  vars TEXT[] NOT NULL DEFAULT '{}'
);
