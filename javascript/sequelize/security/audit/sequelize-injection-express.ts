import m = require('../m/index')
import { Request, Response, NextFunction } from 'express'

module.exports = function search () {
  return (req: Request, res: Response, next: NextFunction) => {
    let criteria = req.query.foo
    // ok: express-sequelize-injection
    m.sequelize.query(
      'SELECT * FROM projects WHERE status = ?',
      {
        replacements: [req.body.foo],
        type: QueryTypes.SELECT
      }
    )
    // ok: express-sequelize-injection
    m.sequelize.query(
      'SELECT * FROM projects WHERE status = ?',
      {
        replacements: [req.body.foo],
        type: QueryTypes.SELECT
      }
    )
    let obj =  {
        replacements: [req.body.foo],
        type: QueryTypes.SELECT
      }
    // ok: express-sequelize-injection
    let projects = 'projects'
      sequelize.query(
        `SELECT * FROM ${projects} WHERE status = ?`,
        obj
      )
    // ruleid: express-sequelize-injection
    m.sequelize.query(`SELECT * FROM Foo WHERE ((criteria LIKE '%${criteria}%))`) 
    // ruleid: express-sequelize-injection
    sequelize.query(`SELECT * FROM Foo WHERE ((criteria LIKE '%${obj.replacements[0]}%))`) 
  }
}