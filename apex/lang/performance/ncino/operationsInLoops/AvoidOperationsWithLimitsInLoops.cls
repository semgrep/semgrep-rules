public class AvoidOperationsWithLimitsInLoops {
	public void messageInsideOfLoop() {
		for (Integer i = 0; i < 151; i++) {
			Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
			// ruleid: avoid-operations-with-limits-in-loops
			Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
		}
	}

	public void messageInsideOfLoop2() {
		for (Account a : accounts) {
			Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
			// ruleid: avoid-operations-with-limits-in-loops
			Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
		}
	}

	public void messageInsideOfLoop3() {
		while (someCondition) {
			Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
			// ruleid: avoid-operations-with-limits-in-loops
			Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
		}
	}

	public void messageInsideOfLoop4() {
		do {
			Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
			// ruleid: avoid-operations-with-limits-in-loops
			Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});
		} while (someCondition);
	}

	public void approvalInsideOfLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-operations-with-limits-in-loops
			Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
			req.setObjectId(acc.Id);
			Approval.process(req);
			Approval.lock(acc);
			Approval.unlock(acc);
		}
	}

	public void approvalInsideOfLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-operations-with-limits-in-loops
			Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
			req.setObjectId(acc.Id);
			Approval.process(req);
			Approval.lock(acc);
			Approval.unlock(acc);
		}
	}

		public void approvalInsideOfLoop3() {
		while (someCondition) {
			// ruleid: avoid-operations-with-limits-in-loops
			Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
			req.setObjectId(acc.Id);
			Approval.process(req);
			Approval.lock(acc);
			Approval.unlock(acc);
		}
	}

	public void approvalInsideOfLoop4() {
		do {
			// ruleid: avoid-operations-with-limits-in-loops
			Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
			req.setObjectId(acc.Id);
			Approval.process(req);
			Approval.lock(acc);
			Approval.unlock(acc);
		} while (someCondition);
	}

	public void asyncInsideOfLoop() {
		for (Integer i = 0; i < 151; i++) {
			// ruleid: avoid-operations-with-limits-in-loops
			System.enqueueJob(new MyQueueable());
			// ruleid: avoid-operations-with-limits-in-loops
			System.schedule('x', '0 0 0 1 1 ?', new MySchedule());
			// ruleid: avoid-operations-with-limits-in-loops
			System.scheduleBatch(new MyBatch(), 'x', 1);
		}
	}

	public void asyncInsideOfLoop2() {
		for (Account a : accounts) {
			// ruleid: avoid-operations-with-limits-in-loops
			System.enqueueJob(new MyQueueable());
			// ruleid: avoid-operations-with-limits-in-loops
			System.schedule('x', '0 0 0 1 1 ?', new MySchedule());
			// ruleid: avoid-operations-with-limits-in-loops
			System.scheduleBatch(new MyBatch(), 'x', 1);
		}
	}

	public void asyncInsideOfLoop3() {
		while (someCondition) {
			// ruleid: avoid-operations-with-limits-in-loops
			System.enqueueJob(new MyQueueable());
			// ruleid: avoid-operations-with-limits-in-loops
			System.schedule('x', '0 0 0 1 1 ?', new MySchedule());
			// ruleid: avoid-operations-with-limits-in-loops
			System.scheduleBatch(new MyBatch(), 'x', 1);
		}
	}

	public void asyncInsideOfLoop4() {
		do {
			// ruleid: avoid-operations-with-limits-in-loops
			System.enqueueJob(new MyQueueable());
			// ruleid: avoid-operations-with-limits-in-loops
			System.schedule('x', '0 0 0 1 1 ?', new MySchedule());
			// ruleid: avoid-operations-with-limits-in-loops
			System.scheduleBatch(new MyBatch(), 'x', 1);
		} while (someCondition);
	}
}
