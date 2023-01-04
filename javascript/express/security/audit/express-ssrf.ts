import { Request, Response, NextFunction } from 'express'

const request = require('request')

module.exports = function badNormal () {
  return (req: Request, res: Response, next: NextFunction) => {
    const url = "//"+req.body.imageUrl
    const url1 = req.body['imageUrl'] + 123
    // ruleid: express-ssrf
    request.get(url)
    // ruleid: express-ssrf
    request.get(url1+123)
    // ok: express-ssrf
    request.get(`https://reddit.com/${req.query.url}/fooo`)
    // ok: express-ssrf
    request.get("https://google.com/"+req.query.url)
    // ok: express-ssrf
    request.get(config_value.foo+req.query.url)
    // ok: express-ssrf
    request.get(config_value.foo+req.body.shouldalsonotcatch)
    // ok: express-ssrf
    request.get(config_value.foo+req)

    // ruleid: express-ssrf
    request.get(req.body.url)
    // ruleid: express-ssrf
    request.get(`${req.query.url}/fooo`)
    // ruleid: express-ssrf
    request.get("//"+req.query.url+config_value.url)

    const a = req.body.url
    // ruleid: express-ssrf
    request.get(a)
    // ruleid: express-ssrf
    request.get(`${url1}/fooo`)
    // ruleid: express-ssrf
    request.get(a+config_value.url)

    // ok: express-ssrf
    request.get(c+a)
    // ok: express-ssrf
    request.get(`${c}${a}/fooo`)
    // ok: express-ssrf
    request.get(c+a+config_value.url)

    // ok: express-ssrf
    request.get(c)
    // ok: express-ssrf
    request.get(`${c}`)
    // ok: express-ssrf
    request.get(c+config_value.url)

    // ruleid: express-ssrf
    request.get(req.body['url'])
    // ruleid: express-ssrf
    request.get(`${req.body['url']}/fooo`)
    // ruleid: express-ssrf
    request.get(req.body['url']+config_value.url)

    // ruleid: express-ssrf
    request.get("https://"+url1)
    // ruleid: express-ssrf
    request.get(`https://${req.body['url']}/fooo`)
    // ruleid: express-ssrf
    request.get("https://"+req.body['url']+config_value.url)
    // ruleid: express-ssrf
    request.get("//"+req.body['url']+config_value.url)
    // ok: express-ssrf
    request.get("//"+c+req.body['url']+config_value.url)
    // todo: express-ssrf
    request.get("https://google.com"+req.query.url)

}
}


module.exports = function badWithTypes () {
  return ({ body }: Request, res: Response, next: NextFunction) => {
    const url = body.url
    // ruleid: express-ssrf
    request.get(url)
  }

}

module.exports = function goodWithTypes () {
  return ({ params, query, session }: Request, res: Response, next: NextFunction) => {
    const url = session
    // ok: express-ssrf
     request.get(url)
  }

}


module.exports = function advanced () {
  return ({ body }: Request, res: Response, next: NextFunction) => {
    const url = body.url

    joinModeOrDeepSemgrep(url, res, next)

  }

  function joinModeOrDeepSemgrep (url: string, res: Response, next: NextFunction) {

      // todo: express-ssrf
      request.get(url)

  }

}
