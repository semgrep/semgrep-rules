class Bar {
    void main() {
        boolean myBoolean; 

        //myBoolean == myBoolean;

        // ruleid:assignment-comparison
        if (myBoolean = true) {
            continue;
        }

        // ruleid:hardcoded-eq-true-or-false
        if (true) { 
            continue;
        }

        // todoruleid:hardcoded-eq-true-or-false
        if (true && false) { 
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

    } 
} 