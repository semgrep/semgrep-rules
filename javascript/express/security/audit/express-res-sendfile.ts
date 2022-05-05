import path = require('path')
import { Request, Response, NextFunction } from 'express'


module.exports = function badNormal () {
  return (req: Request, res: Response, next: NextFunction) => {
    const file = req.params.file
    // ruleid: express-res-sendfile
    res.sendFile(path.resolve('ftp/', file))
    // ruleid: express-res-sendfile
    res.sendFile(path.join('/ftp/', file))
    // ruleid: express-res-sendfile
    res.sendFile(file)
  }


}
module.exports = function goodNormal () {
  return (req: Request, res: Response, next: NextFunction) => {
    const file = 'foo'
    // ok: express-res-sendfile
    res.sendFile(path.resolve('ftp/', file))
    // ok: express-res-sendfile
    res.sendfile(req.app.get('staticFilePath') + '/index-test.html');
    // diffrent rule 
    // ok: express-res-sendfile
    res.sendfile(req.params.foo, {root: '/'});
    // ok: express-res-sendfile
    res.sendfile(req.params.foo, options);
  }

}


module.exports = function badWithTypes () {
  return ({ params, query }: Request, res: Response, next: NextFunction) => {
    const file = params.file
    // ruleid: express-res-sendfile
    res.sendFile(path.resolve('ftp/', file))
    // ruleid: express-res-sendfile
    res.sendFile(path.join('/ftp/', file))
    // ruleid: express-res-sendfile
    res.sendFile(file)
    // diffrent rule 
    // ok: express-res-sendfile
    res.sendfile(file, {root: '/'});
  }

}

module.exports = function goodWithTypes () {
  return ({ params, query, session }: Request, res: Response, next: NextFunction) => {
    const file = session
    // ok: express-res-sendfile
    res.sendFile(path.resolve('ftp/', file))
  }

}


module.exports = function advanced () {
  return ({ params, query }: Request, res: Response, next: NextFunction) => {
    const file = params.file

    if (!file.includes('/')) {
      joinModeOrDeepSemgrep(file, res, next)
    } 
  }

  function joinModeOrDeepSemgrep (file: string, res: Response, next: NextFunction) {

      // ruleid: express-res-sendfile
      res.sendFile(path.resolve('ftp/', file))

  }

}
