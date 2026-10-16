class Bar {
    void main() {
        boolean myBoolean;

        //myBoolean == myBoolean;

        // ruleid:eqeq
        if (myBoolean == myBoolean) {
            continue;
        }

        // ruleid:eqeq
        if (myBoolean != myBoolean) {
            continue;
        }

        float someFloat;
        // ruleid:eqeq
        if (someFloat != someFloat) {
            continue;
        }
    }
}

class TernaryCondition {
    void main() {
        BooleanExpression expr = null;
        BooleanExpression other = null;

        // ok:eqeq
        expr = (expr != null ? expr.and(other) : other);
    }
}

class BooleanExpression {
    BooleanExpression and(BooleanExpression other) {
        return other;
    }
}
