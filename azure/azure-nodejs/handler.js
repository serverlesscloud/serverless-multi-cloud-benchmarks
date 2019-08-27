'use strict';

module.exports.hello = (context, req) => {

  const res = {};
  res.status = 200
  res.body = `Hello`;
  context.done(null, res);
};