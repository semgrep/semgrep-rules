package com.test;

import java.security.SecureRandom

public class Cases {

    public void case1(String param, long x) {
        //ruleid: use-of-sha1prng
        SecureRandom sr0 = SecureRandom.getInstance("SHA1PRNG")
    }

    public void case2(String param, long x) {
        //ok: use-of-sha1prng
        SecureRandom sr1 = SecureRandom.getInstance("NativePRNG");
        //ok: use-of-sha1prng
        SecureRandom sr2 = new SecureRandom();     
        //ok: use-of-sha1prng
        SecureRandom sr3 = SecureRandom.getInstanceStrong();
    }
}