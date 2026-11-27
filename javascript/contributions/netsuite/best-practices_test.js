/**
 * Semgrep Test File for NetSuite Gatekeeper
 */

// --- SHOULD FAIL ---
// ruleid: netsuite-enforce-sri-cdn
const badCdn = '<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>';

// --- SHOULD PASS ---
// ok: netsuite-enforce-sri-cdn
const goodCdn = '<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-abc" crossorigin="anonymous"></script>';

// ==========================================
// --- SHOULD FAIL (Architectural Risks) ---
// ==========================================

// ruleid: netsuite-unhandled-aftersubmit-try-catch
function afterSubmit(context) {
    const rec = context.newRecord;
    
    // ruleid: netsuite-hardcoded-internal-id 
    let heavyRec = record.load({ type: 'salesorder', id: 7899 });

    for (let i = 0; i < 10; i++) {
      
        // ruleid: netsuite-no-record-load-save-in-loop
        const otherRec = record.load({ type: 'customer', id: i });
        
        // ruleid: netsuite-no-record-load-save-in-loop
        otherRec.save();
    }
    
    // ruleid: netsuite-no-console-log
    console.log('Testing...');

    // ruleid: netsuite-no-generic-custom-ids
    const fieldId = 'custbody123'; 
    
    // ruleid: netsuite-query-injection
    query.runSuiteQL({ query: 'SELECT * FROM x WHERE id = ' + userId });

}

// ==========================================
// --- SHOULD PASS (ABCD Standards) ---
// ==========================================
// ok: netsuite-unhandled-aftersubmit-try-catch
function afterSubmit(context) {
    try {
        // ok: netsuite-hardcoded-internal-id
        // ok: netsuite-unbounded-search
        const results = mySearch.run().getRange({ start: 0, end: 10 });

        // ok: netsuite-query-injection
        query.runSuiteQL({
            query: 'SELECT * FROM employee WHERE id = ?',
            params: ['123']
        });
    } catch (e) {
        log.error('Error', e);
    }
}

/**
 * Semgrep Test File for NetSuite Gatekeeper
 */

// ==========================================
// --- SHOULD FAIL (Optimization Risk) ---
// ==========================================

function updateMemo(recordId) {
    // ruleid: netsuite-prefer-submit-fields
    var rec = record.load({
        type: record.Type.SALES_ORDER,
        id: recordId
    });
    rec.setValue({
        fieldId: 'memo',
        value: 'Updated via Gatekeeper'
    });
    rec.save();
}

// ==========================================
// --- SHOULD PASS (Valid Load/Save) ---
// ==========================================

function addLineItem(recordId) {
    // ok: netsuite-prefer-submit-fields
    // This is valid because we are modifying a sublist (insertLine)
    var rec = record.load({
        type: record.Type.SALES_ORDER,
        id: recordId
    });
    rec.insertLine({
        sublistId: 'item',
        line: 0
    });
    rec.setCurrentSublistValue({
        sublistId: 'item',
        fieldId: 'item',
        value: 123
    });
    rec.save();
}

function optimizedUpdate(recordId) {
    // ok: netsuite-prefer-submit-fields
    // This is the ABCD-approved way to update a single field
    record.submitFields({
        type: record.Type.SALES_ORDER,
        id: recordId,
        values: {
            'memo': 'Optimized Update'
        }
    });
}