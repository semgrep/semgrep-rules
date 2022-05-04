module.exports.redirect = function (req, res) {

	// ok: express-open-redirect
	res.redirect(`https://reddit.com/${req.query.url}/fooo`)
	// ok: express-open-redirect
	res.redirect("https://google.com/"+req.query.url)
	// ok: express-open-redirect
	res.redirect(config_value.foo+req.query.url)
	// ok: express-open-redirect
	res.redirect(config_value.foo+req.body.shouldalsonotcatch)
	// ok: express-open-redirect
	res.redirect(config_value.foo+req)

	// ruleid: express-open-redirect
	res.redirect(req.query.url)
	// ruleid: express-open-redirect
	res.redirect(`${req.query.url}/fooo`)
	// ruleid: express-open-redirect
	res.redirect(req.query.url+config_value.url)

	// todo: express-open-redirect
	res.redirect("https://google.com"+req.query.url)
}
