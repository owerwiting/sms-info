CREATE TABLE IF NOT EXISTS campaigns (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  import_id UUID REFERENCES imports(id),
  template_id UUID REFERENCES templates(id),
  subaccount_id UUID REFERENCES subaccounts(id),
  schedule_at TIMESTAMPTZ,
  status TEXT,
  created_at TIMESTAMPTZ DEFAULT now()
);
