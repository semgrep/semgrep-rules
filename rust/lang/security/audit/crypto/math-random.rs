fn random() {
    //ruleid: math-random-used
    let x = rand::random();
}
fn thread_rng() {
    //ruleid: math-random-used
    let x = rand::thread_rng();
}

fn thread_rng_1() {
    //todoruleid: math-random-used
    use rand::thread_rng;
    //todoruleid: math-random-used
    let _ = thread_rng();
}
