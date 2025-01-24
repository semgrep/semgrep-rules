module 0xcafe::public_randomness {
    // ruleid: public-randomness
    #[randomness]
    public fun signature_1() : u64 {
        0
    }

    // ruleid: public-randomness
    #[lint::allow_unsafe_randomness]
    public fun signature_2() : u64 {
        0
    }

    // ok: public-randomness
    #[randomness]
    public(friend) fun signature_3() : u64 {
        0
    }

    // ok: public-randomness
    #[test, randomness]
    public fun signature_4() : u64 {
        0
    }
}

#[test_only]
module 0xcafe::test_public_randomness {
    // ok: public-randomness
    #[randomness]
    public fun signature_5() : u64 {
        0
    }
}
module 0xcafe::a {
    use aptos_framework::randomness::u8_integer;
    friend 0x86dfc5ebdf7fc8c7fa19d3cce075bb7f6bb78c1fbe7f157f29fda6723cb404e5::b;

    #[lint::allow_unsafe_randomness]
    public fun a() {
        let _a = u8_integer();
    }

    #[lint::allow_unsafe_randomness]
    public entry fun b() {
        let _b = u8_integer();
    }

    #[randomness]
    public(friend) entry fun c() {
        let _c = u8_integer();
    }

    public(friend) fun d() {
        let _d = u8_integer();
    }

    #[randomness]
    entry fun e() {
        let _e = u8_integer();
    }

}
