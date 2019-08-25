'use strict';

exports.hello = (request, response) => {
  response.status(200).send('hello');
};