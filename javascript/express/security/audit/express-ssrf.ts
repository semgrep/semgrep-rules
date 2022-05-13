import { Request, Response, NextFunction } from 'express'

const request = require('request')

module.exports = function badNormal () {
  return (req: Request, res: Response, next: NextFunction) => {
    const url = req.body.imageUrl
    // ruleid: express-ssrf
    request.get(url)

}
}
module.exports = function goodNormal () {
  return (req: Request, res: Response, next: NextFunction) => {
    const url = 'https://google.com'
    // ok: express-ssrf
     request.get(url)
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
