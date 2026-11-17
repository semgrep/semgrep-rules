import { createClient } from "@supabase/supabase-js";

const url = process.env.NEXT_PUBLIC_SUPABASE_URL!;

// ruleid: supabase-service-role-key-public-env
const adminKey = process.env.NEXT_PUBLIC_SUPABASE_SERVICE_ROLE_KEY;

export const admin = createClient(
  url,
  // ruleid: supabase-service-role-key-public-env
  process.env.NEXT_PUBLIC_SUPABASE_SERVICE_ROLE_KEY!
);

// ruleid: supabase-service-role-key-public-env
const k2 = process.env["NEXT_PUBLIC_SERVICE_KEY"];

// ruleid: supabase-service-role-key-public-env
const { NEXT_PUBLIC_SUPABASE_SERVICE_ROLE_KEY } = process.env;

// ok: supabase-service-role-key-public-env
const serverKey = process.env.SUPABASE_SERVICE_ROLE_KEY;

// ok: supabase-service-role-key-public-env
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY;

// ok: supabase-service-role-key-public-env
export const server = createClient(url, process.env.SUPABASE_SERVICE_ROLE_KEY!);