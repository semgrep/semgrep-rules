public class UseAssertClass {
	// ruleid: ncino.apex.tests.use-assert-class
	System.assert(true);

	// ruleid: ncino.apex.tests.use-assert-class
	System.assertEquals(1,1);

	// ruleid: ncino.apex.tests.use-assert-class
	System.assertNotEquals(1,1);

	// ok: ncino.apex.tests.use-assert-class
	Assert.areEqual(1,1);
}