class Bar {
    void main() {
        boolean myBoolean;

        // ruleid:hardcoded-conditional
        if (myBoolean = true) {
            continue;
        }

        // ruleid:hardcoded-conditional
        if (true) {
            continue;
        }

        // ruleid:hardcoded-conditional
        if (true && false) {
            continue;
        }

        // ok:hardcoded-conditional
        if (myBoolean) {

        }

        // ok:hardcoded-conditional
        if (myBoolean == myBoolean) {
            continue;
        }

        // ok:hardcoded-conditional
        if (myBoolean != myBoolean) {
            continue;
        }

    }
}
