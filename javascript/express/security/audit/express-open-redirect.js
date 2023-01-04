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
	res.redirect(req.body.url)
	// ruleid: express-open-redirect
	res.redirect(`${req.query.url}/fooo`)
	// ruleid: express-open-redirect
	res.redirect(req.query.url+config_value.url)

	const a = req.body.url
	const b = req.body['url']
	// ruleid: express-open-redirect
	res.redirect(a)
	// ruleid: express-open-redirect
	res.redirect(`${b}/fooo`)
	// ruleid: express-open-redirect
	res.redirect(a+config_value.url)

	// ok: express-open-redirect
	res.redirect(c+a)
	// ok: express-open-redirect
	res.redirect(`${c}${a}/fooo`)
	// ok: express-open-redirect
	res.redirect(c+a+config_value.url)

	// ok: express-open-redirect
	res.redirect(c)
	// ok: express-open-redirect
	res.redirect(`${c}`)
	// ok: express-open-redirect
	res.redirect(c+config_value.url)

	// ruleid: express-open-redirect
	res.redirect(req.body['url'])
	// ruleid: express-open-redirect
	res.redirect(`${req.body['url']}/fooo`)
	// ruleid: express-open-redirect
	res.redirect(req.body['url']+config_value.url)

	// ruleid: express-open-redirect
	res.redirect("https://"+req.body['url'])
	// ruleid: express-open-redirect
	res.redirect(`https://${req.body['url']}/fooo`)
	// ruleid: express-open-redirect
	res.redirect("https://"+req.body['url']+config_value.url)

	// todo: express-open-redirect
	res.redirect("https://google.com"+req.query.url)
}
