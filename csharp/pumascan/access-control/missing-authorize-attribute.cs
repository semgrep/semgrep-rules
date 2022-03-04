
// test code from https://pumascan.com/rules/#sec0120-missing-authorize-attribute
class Foo{  
    // ruleid:missing-authorize-attribute 
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Enter(int id, ContestEntryModel model)
    {
        if (ModelState.IsValid)
        {
            submitContestEntry(id, model);
        }
    }

    // ok:missing-authorize-attribute 
    [Authorize(Policy = Scopes.EnterContent)]
    [HttpPost]
    [ValidateAntiForgeryToken]
    public ActionResult Enter(int id, ContestEntryModel model)
    {
        if (ModelState.IsValid)
        {
            submitContestEntry(id, model);
        }
    }
}
            