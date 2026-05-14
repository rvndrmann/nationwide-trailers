-- =============================================
-- Nationwide Semi Trailer Hire — Supabase Setup
-- Run this in: Supabase Dashboard > SQL Editor
-- =============================================

-- 1. Create QUOTES table
CREATE TABLE IF NOT EXISTS quotes (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT now(),
  status TEXT DEFAULT 'new',
  full_name TEXT NOT NULL,
  company TEXT,
  phone TEXT NOT NULL,
  email TEXT NOT NULL,
  trailer_type TEXT,
  hire_duration TEXT,
  start_date DATE,
  delivery_location TEXT,
  message TEXT
);

-- 2. Create LOCATIONS table
CREATE TABLE IF NOT EXISTS locations (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  created_at TIMESTAMPTZ DEFAULT now(),
  name TEXT NOT NULL,
  type TEXT DEFAULT 'Service Location',
  address TEXT,
  suburb TEXT,
  postcode TEXT,
  state TEXT,
  phone TEXT,
  email TEXT,
  hours TEXT,
  support TEXT,
  directions TEXT
);

-- 3. Enable Row Level Security
ALTER TABLE quotes ENABLE ROW LEVEL SECURITY;
ALTER TABLE locations ENABLE ROW LEVEL SECURITY;

-- 4. QUOTES policies
-- Anyone can submit a quote (public contact form)
CREATE POLICY "Allow anonymous insert on quotes"
  ON quotes FOR INSERT
  TO anon
  WITH CHECK (true);

-- Only authenticated (admin) can read quotes
CREATE POLICY "Allow authenticated select on quotes"
  ON quotes FOR SELECT
  TO authenticated
  USING (true);

-- Only authenticated (admin) can update quotes
CREATE POLICY "Allow authenticated update on quotes"
  ON quotes FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Only authenticated (admin) can delete quotes
CREATE POLICY "Allow authenticated delete on quotes"
  ON quotes FOR DELETE
  TO authenticated
  USING (true);

-- 5. LOCATIONS policies
-- Anyone can read locations (public pages)
CREATE POLICY "Allow public select on locations"
  ON locations FOR SELECT
  TO anon, authenticated
  USING (true);

-- Only authenticated (admin) can insert locations
CREATE POLICY "Allow authenticated insert on locations"
  ON locations FOR INSERT
  TO authenticated
  WITH CHECK (true);

-- Only authenticated (admin) can update locations
CREATE POLICY "Allow authenticated update on locations"
  ON locations FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Only authenticated (admin) can delete locations
CREATE POLICY "Allow authenticated delete on locations"
  ON locations FOR DELETE
  TO authenticated
  USING (true);

-- 6. Insert default locations
INSERT INTO locations (name, type, address, suburb, postcode, state, phone, email, hours)
VALUES
  ('Melbourne — Head Office', 'Head Office', '', 'Melbourne', '3000', 'VIC', '1300 XXX XXX', 'info@nationwidetrailers.com.au', 'Mon-Fri 7:00 AM - 5:00 PM AEST'),
  ('Sydney', 'Service Location', '', 'Sydney', '2000', 'NSW', '1300 XXX XXX', 'sydney@nationwidetrailers.com.au', 'Mon-Fri 7:00 AM - 5:00 PM AEST'),
  ('Brisbane', 'Service Location', '', 'Brisbane', '4000', 'QLD', '1300 XXX XXX', 'brisbane@nationwidetrailers.com.au', 'Mon-Fri 7:00 AM - 5:00 PM AEST'),
  ('Perth', 'Service Location', '', 'Perth', '6000', 'WA', '1300 XXX XXX', 'perth@nationwidetrailers.com.au', 'Mon-Fri 7:00 AM - 5:00 PM AWST');

-- 7. Create SITE_SETTINGS table (single-row config)
CREATE TABLE IF NOT EXISTS site_settings (
  id INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  phone TEXT DEFAULT '1300 XXX XXX',
  support_phone TEXT DEFAULT '1300 XXX XXX',
  email TEXT DEFAULT 'info@nationwidetrailers.com.au',
  updated_at TIMESTAMPTZ DEFAULT now()
);

-- 8. Enable RLS on site_settings
ALTER TABLE site_settings ENABLE ROW LEVEL SECURITY;

-- Anyone can read settings (public pages need the phone number)
CREATE POLICY "Allow public select on site_settings"
  ON site_settings FOR SELECT
  TO anon, authenticated
  USING (true);

-- Only authenticated (admin) can update settings
CREATE POLICY "Allow authenticated update on site_settings"
  ON site_settings FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

-- Insert default settings row
INSERT INTO site_settings (id, phone, support_phone, email)
VALUES (1, '1300 XXX XXX', '1300 XXX XXX', 'info@nationwidetrailers.com.au');
