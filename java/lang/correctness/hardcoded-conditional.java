class Bar {
    void main(boolean arg) {
        boolean myBoolean;

        // ruleid:hardcoded-conditional
        if (myBoolean = true) {
            continue;
        }
        // note that with new constant propagation, myBoolean is assumed
        // to true below

        // ruleid:hardcoded-conditional
        if (true) {
            continue;
        }

        // ruleid:hardcoded-conditional
        if (true && false) {
            continue;
        }

        // the dataflow constant-propagation now kicks in! this is true!
        // ruleid:hardcoded-conditional
        if (myBoolean) {

        }
        // to prevent constant propagation to assumes
        // myBoolean is true below
        myBoolean = arg;

        // ok:hardcoded-conditional
        if (myBoolean == myBoolean) {
            continue;
        }

        // ok:hardcoded-conditional
        if (myBoolean != myBoolean) {
            continue;
        }

        // ok:hardcoded-conditional
        if (moveToChild(curs, index, false, false))
        {
            removeToken(curs);
        }

    }
}
