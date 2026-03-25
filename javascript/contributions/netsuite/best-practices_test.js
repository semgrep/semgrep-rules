// --- SHOULD FAIL ---
function afterSubmit(context) {
    
    const rec = context.newRecord;
    
    for (let i = 0; i < 10; i++) {
        // ruleid: netsuite-no-record-load-save-in-loop
        // ruleid: netsuite-unhandled-aftersubmit-try-catch
        const otherRec = record.load({ type: 'customer', id: i });
    }
    
    // ruleid: netsuite-no-console-log
    console.log('Testing...');
}

// --- SHOULD PASS ---
function afterSubmit(context) {
    try {
        log.debug('Safe execution');
    } catch (e) {
        log.error('Error handled', e);
    }
}