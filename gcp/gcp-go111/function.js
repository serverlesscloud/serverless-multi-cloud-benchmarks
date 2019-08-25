'use strict';

exports.hello = (request, response) => {
  response.status(200).send('hello');
};

exports.users = (request, response) => {
  switch (request.method) {
    case 'GET':
      response.status(200).send('user');
      break;
    case 'PUT':
      response.status(201).send('created');
      break;
    default:
      response.status(500).send('unsupported method');
      break;
  }
};