import utils = require('../lib/utils')
import { Request, Response } from 'express'

const db = require('../a/mongodb')

module.exports = function trackOrder () {
  return (req: Request, res: Response) => {
    const id = foo.a() ? String(req.params.id) : req.params.id

    // ruleid: express-mongo-nosqli
    db.a.find({ $where: `this.orderId === '${id}'` })
    // ok: express-mongo-nosqli
    db.a.find({ $where: `this.orderId === '${a}'` })
    // ruleid: express-mongo-nosqli
    db.a.find({ $where: "this.orderId" === req.params.id })
    // ruleid: express-mongo-nosqli
    db.a.update({ _id: req.body.id })
    // ok: express-mongo-nosqli
    db.a.find({ $where: "this.orderId" === req.params.id.toString() })
    // ruleid: express-mongo-nosqli
    db.findOne({username: req.body.user, password: req.body.pass, isActive: true},function(err, result){})
  }
}
var mongo = require('mongodb')

function authenticate(req, res){
	mongo.connect('mongodb://me:96/users', function(err, db){
    // ruleid: express-mongo-nosqli
		db.findOne({username: req.body.user, password: req.body.pass, isActive: true},function(err, result){
		
		});
    // ok: express-mongo-nosqli
		db.findOne({username: mongo.ObjectId(req.body.user), password: mongo.ObjectId(req.body.pass), isActive: true},function(err, result){
    // ok: express-mongo-nosqli
    db.findOne({username: String(req.body.user), password: String(req.body.pass), isActive: true},function(err, result){})
    // ok: express-mongo-nosqli
    db.findOne({username: req.body.user.toString(), password: req.body.pass.toString(), isActive: true},function(err, result){})
		});		
	});	
}
