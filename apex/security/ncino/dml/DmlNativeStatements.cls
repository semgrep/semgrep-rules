public class DMLNativeStatements {
    public void dmlInsert() {
        Account act = new Account(
            // ok: apex.dml.dml-native-statements
            Name = 'insert'
        );
        // ruleid: apex.dml.dml-native-statements
        insert act;
    }

    public void databaseInsert() {
        Account act = new Account(
            // ok: apex.dml.dml-native-statements
            Name = 'insert'
        );
        // ruleid: apex.dml.dml-native-statements
        Database.insert(act);
    }

    public void utilityInsert() {
        Account act = new Account(
            // ok: apex.dml.dml-native-statements
            Name = 'insert'
        );
        // ok: apex.dml.dml-native-statements
        nFORCE.DMLUtility.insertObj(act);
    }

    public void dmlUpsert() {
        Account[] acctsList = [
            SELECT
                Id,
                Name,
                BillingCity
            FROM
                Account
            WHERE
                BillingCity = 'Bombay'
        ];

        for (Account a : acctsList) {
            a.BillingCity = 'Mumbai';
        }

        // ok: apex.dml.dml-native-statements
        Account newAcct = new Account(Name = 'upsert', BillingCity = 'San Francisco');
        acctsList.add(newAcct);

        // ruleid: apex.dml.dml-native-statements
        upsert acctsList;
    }

    public void databaseUpsert() {
        Account[] acctsList = [
            SELECT
                Id,
                Name,
                BillingCity
            FROM
                Account
            WHERE
                BillingCity = 'Bombay'
        ];

        for (Account a : acctsList) {
            a.BillingCity = 'Mumbai';
        }

        // ok: apex.dml.dml-native-statements
        Account newAcct = new Account(Name = 'upsert', BillingCity = 'San Francisco');
        acctsList.add(newAcct);

        // ruleid: apex.dml.dml-native-statements
        Database.upsert(acctsList);
    }

    public void utilityUpsert() {
        Account[] acctsList = [
            SELECT
                Id,
                Name,
                BillingCity
            FROM
                Account
            WHERE
                BillingCity = 'Bombay'
        ];

        for (Account a : acctsList) {
            a.BillingCity = 'Mumbai';
        }

        // ok: apex.dml.dml-native-statements
        Account newAcct = new Account(Name = 'upsert', BillingCity = 'San Francisco');
        acctsList.add(newAcct);

        // ok: apex.dml.dml-native-statements
        nFORCE.DMLUtility.upsertObjs(acctsList);
    }

    public void dmlUpdate() {
        Account updtAct = [
            SELECT
                BillingCity
            FROM
                Account
            WHERE
                // ok: apex.dml.dml-native-statements
                Name='update'
            LIMIT 1
        ];

        // ok: apex.dml.dml-native-statements
        updtAct.BillingCity = 'update';

        // ruleid: apex.dml.dml-native-statements
        update updtAct;
    }

    public void databaseUpdate() {
        Account updtAct = [
            SELECT
                BillingCity
            FROM
                Account
            WHERE
                // ok: apex.dml.dml-native-statements
                Name='update'
            LIMIT 1
        ];

        // ok: apex.dml.dml-native-statements
        updtAct.BillingCity = 'update';

        // ruleid: apex.dml.dml-native-statements
        Database.update(updtAct);
    }

    public void utilityUpdate() {
        Account updtAct = [
            SELECT
                BillingCity
            FROM
                Account
            WHERE
                // ok: apex.dml.dml-native-statements
                Name='update'
            LIMIT 1
        ];

        // ok: apex.dml.dml-native-statements
        updtAct.BillingCity = 'update';

        // ok: apex.dml.dml-native-statements
        nFORCE.DMLUtility.updateObj(updtAct);
    }

    public void dmlDelete() {
        Account dltAct = [
            SELECT
                Id
            FROM
                Account
            WHERE
                // ok: apex.dml.dml-native-statements
                Name='delete'
            LIMIT 1
        ];

        // ruleid: apex.dml.dml-native-statements
        delete dltAct;
    }

    public void databaseDelete() {
        Account dltAct = [
            SELECT
                Id
            FROM
                Account
            WHERE
                // ok: apex.dml.dml-native-statements
                Name='delete'
            LIMIT 1
        ];

        // ruleid: apex.dml.dml-native-statements
        Database.delete(dltAct);
    }

    public void utilityDelete() {
        Account dltAct = [
            SELECT
                Id
            FROM
                Account
            WHERE
                // ok: apex.dml.dml-native-statements
                Name='delete'
            LIMIT 1
        ];

        // ok: apex.dml.dml-native-statements
        nFORCE.DMLUtility.deleteObj(dltAct);
    }
}
