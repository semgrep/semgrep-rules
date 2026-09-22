import { NextResponse } from 'next/server'
import { NextRequest } from 'next/server'

export function middleware(req: NextRequest) {
  const taintedHeaders = new Headers(req.headers);

  // ruleid: nextjs-middleware-ssrf
  NextResponse.next({ headers: req.headers });

  // ruleid: nextjs-middleware-ssrf
  NextResponse.next({ headers: taintedHeaders });

  // ok: nextjs-middleware-ssrf
  NextResponse.next({ request: { headers: new Headers() } });

  // ok: nextjs-middleware-ssrf
  NextResponse.next({ request: { headers: req.headers } });

  // ok: nextjs-middleware-ssrf
  NextResponse.next({ request: { headers: taintedHeaders } });
}
