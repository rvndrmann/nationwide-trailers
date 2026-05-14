// Supabase Configuration — Nationwide Semi Trailer Hire
// Shared across contact.html and admin.html

const SUPABASE_URL = 'https://vqanyeaootipyxlqlifo.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZxYW55ZWFvb3RpcHl4bHFsaWZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzg3NDM4MDAsImV4cCI6MjA5NDMxOTgwMH0.nz0pI25SelfPmoE-k65Jnv0MRqpQ1Dmf7hQyJK8T3sc';

const db = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
