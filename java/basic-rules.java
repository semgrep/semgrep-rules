class Bar {
    void main() {
        boolean myBoolean;

        //myBoolean == myBoolean;

        // ruleid:assignment-comparison
        if (myBoolean = true) {
            continue;
        }

        // ok
        if (myBoolean) {

        }

        // ruleid:eqeq-is-bad
        if (myBoolean == myBoolean) {
            continue;
        }

        // ruleid:eqeq-is-bad
        if (myBoolean != myBoolean) {
            continue;
        }

        float someFloat;
        // ruleid:eqeq-is-bad
        if (someFloat != someFloat) {
            continue;
        }
    }
}
