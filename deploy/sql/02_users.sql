CREATE TABLE IF NOT EXISTS users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  email CITEXT UNIQUE NOT NULL,
  pass_hash TEXT NOT NULL,
  role TEXT NOT NULL CHECK (role IN ('ADMIN','OPERATOR','VIEWER')),
  totp_secret TEXT,
  totp_enabled BOOLEAN DEFAULT FALSE,
  last_login_ip INET,
  created_at TIMESTAMPTZ DEFAULT now()
);

6) migrations/sql/03_ip_acl.sql
CREATE TABLE IF NOT EXISTS ip_acl (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID REFERENCES accounts(id) ON DELETE CASCADE,
  cidr CIDR NOT NULL,
  notify_on_new_ip BOOLEAN DEFAULT TRUE
);
