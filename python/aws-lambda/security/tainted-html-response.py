def lambda_handler(event, context):
	html = f"<div>{event['input']}</div>"

	foo = {
		# ok: tainted-html-response
		"data": event['foo']
	}
	bar(foo)

	result = {
		"statusCode": 200,
		# ruleid: tainted-html-response
		"body": html,
		"headers": {
			"Content-Type": "text/html"
		}
	}
	return result
